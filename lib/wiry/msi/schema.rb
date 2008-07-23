module MSI
  
  class Schema
    
    def self.dump(db)
      columns = Hash.new{|h,k| h[k] = [] }
      v = db.execute('SELECT * FROM _Columns')
      v.to_a.each do |name, *args|
        columns[name] << export(*args)
      end
      v.close
      columns
    end
    
    def self.[](table)
      @@schema[table]
    end

    def self.tables
      @@schema.keys
    end
    
    def self.export(i, name, bits)
      a = []
      a << type =  case bits & MSI::TYPEMASK
           when MSI::TYPE_STRING : :char
           when MSI::TYPE_SHORT  : :short
           when MSI::TYPE_LONG   : :long
           when MSI::TYPE_BINARY : :object
           else
             raise "Unknown integer type"
           end
      a << name.downcase.to_sym
      size = bits & MSI::DATASIZEMASK
      a << {:size => size}  if (size > 0) && (type == 'char')
      a << {:null => false} unless (bits & MSI::TYPE_NULLABLE) > 0
      a << {:local => true} if (bits & MSI::TYPE_LOCALIZABLE) > 0
      a << {:key => true}   if (bits & MSI::TYPE_KEY) > 0
      a
    end
    
    def initialize(name)
      @name = name
      @columns = []
      @keys = []
      yield self if block_given?
    end
    
    def method_missing(meth, *args)
      if %w{char character longchar short int integer long object}.include? meth.to_s.downcase
        column(args.shift, meth, *args)
      else
        super
      end
      self
    end
    
    def column(name, type, *opts)
      column = []
      type = type.to_s.upcase
      opts.each { |i|
        column << "NOT NULL" if i[:null] == false
        column << "LOCALIZABLE" if i[:local]
        @keys << quote_name(name) if i[:key]
        type = "#{type}(#{i[:size]})" if i[:size]
      }
      column.unshift type
      column.unshift quote_name(name)
      @columns << column.join(' ')
    end
    
    def quote_name(sym)
      "`#{sym.to_s.capitalize}`"
    end
    
    def columns
      @columns.join(', ')
    end
    
    def keys
      " PRIMARY KEY #{@keys.join(', ')}" unless @keys.empty?
    end
    
    def to_s
      "CREATE TABLE #{@name} (#{columns}#{keys})"
    end
  
  end

end