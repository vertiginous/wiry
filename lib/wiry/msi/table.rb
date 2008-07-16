module MSI

  class Table
  
    def self.create(name, &block)
      "CREATE TABLE #{name} ()"
    end
    
    def initialize(name, db)
      @name = name
      @db   = db
    end
    
    def all(opts = nil)
      select('*')
    end
    
    def select(*columns)
      @db.do "SELECT #{columns.join(', ')} FROM #{@name}"
    end
    
    def insert(*fields)
      v = self.all
      r = MSI.conn.CreateRecord(v.types.size)
      fields.each_with_index{ |f, i| export(f, i+1, r) }
      v << r
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
      else 
        Raise 'Unsupported column type'
      end
    end
    
  end

end