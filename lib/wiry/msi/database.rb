module MSI

  class Database

    attr_reader :summary
    
    def self.connect(name, mode=MSI::OpenDatabaseModeTransact)
      begin
        new(name, mode)
      rescue WIN32OLERuntimeError
        raise MSI::Record.new(MSI.conn.LastErrorRecord).to_a.inspect
      end
    end

    def initialize(name, mode=MSI::OpenDatabaseModeCreate)
      @db = MSI.conn.OpenDatabase(name, mode)
      @db.Commit
      @db
    end

    def execute(sql)
      begin
        v = View.new(@db.OpenView(sql))
        @db.Commit
        v
      rescue WIN32OLERuntimeError
        raise MSI::Record.new(MSI.conn.LastErrorRecord).to_a.inspect
      end
    end

    alias :do :execute
    
    def [](name)
      Table.new(name.to_s, self)
    end
    
    def commit
      @db.commit
    end

    def close
      commit
      @db.ole_free
      @db = nil
    end
    
    def tables
      execute('SELECT Name FROM _Tables').to_a.flatten
    end
    
    def create_table(hash)
      hash.each do|table, data|
        schema = Schema.new(table){ |s| 
          data.each{|d| s.send(*d)}
        }
        v = execute( schema.to_s )
        v.close        
      end
    end
    alias :create_tables :create_table
    
    def drop_table(name)
      v = execute( "DROP TABLE #{name}" )
      v.close
    end

  end

end