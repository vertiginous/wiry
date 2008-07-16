module MSI

  class Record

    def initialize(record, types=nil)
      @record = record
      @types = types || Array.new(size, 's')
    end

    def import(field, index)
      case field.downcase[0]
      when ?s, ?l
       @record.StringData(index)
      when ?i
        @record.IntegerData(index)
      when ?v
        size = @record.DataSize(index)
        @record.ReadStream(index, size, MSI::ReadStreamBytes)
      else
        raise "Unsupported column type: #{field}"
      end
    end

    def export(data, index)
      case data
      when String, Symbol
       @record['StringData', index] = data.to_s
      when Integer
        @record['IntegerData', index] = data
      # when ?v
      #   @record.SetStream(index, data)
      else
        raise "Unsupported column type: #{field}"
      end
    end
    
    def insert(record)
      @view.Modify(MSI::ViewModifyInsert, record)
    end
    
    def to_a
      a = []
      @types.each_with_index{|f,i| a << import(f,i+1) }
      a
    end

    def size
      @record.FieldCount
    end

  end

end