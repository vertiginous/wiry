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
    
    def create_table(name, &block)
      execute Schema.new(name, &block).to_s
    end

  end

end