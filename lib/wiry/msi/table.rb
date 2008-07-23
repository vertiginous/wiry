module MSI

  class Table
    
    def initialize(name, db)
      @name = name
      @db   = db
    end
    
    def all(opts = nil)
      select('*')
    end
    
    def select(*columns)
      v = @db.do "SELECT #{columns.join(', ')} FROM #{@name}"
      a = v.to_a
      v.close
      a
    end
    
    def insert(*fields)
      v = @db.do("SELECT * FROM #{@name}")
      r = MSI.conn.CreateRecord(v.types.size)
      fields.each_with_index{ |f, i| export(f, i+1, r) }
      v << r
      v.close
      @db.commit
    end
    
    def <<(array)
      insert(*array)
    end
    
    def export(item, index, record)
      case item
      when String
        record['Stringdata', index] = item
      when Integer
        record['Integerdata', index] = item
      when NilClass
         return
      when Array
        raise 'Unsupported column type'
      else
        raise 'Unsupported column type'
      end
    end
    
  end

end