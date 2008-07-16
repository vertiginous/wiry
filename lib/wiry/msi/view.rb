module MSI

  class View
    include Enumerable
    
    def initialize(view)
      @view = view
      @view.Execute
    end
    
    def columns
      r = @view.ColumnInfo(MSI::ColumnInfoNames)
      Record.new(r).to_a
    end
    
    def types
      r = @view.ColumnInfo(MSI::ColumnInfoTypes)
      Record.new(r).to_a
    end

    def close
      @view.Close
      @view.ole_free
      @view = nil
    end
     
    def <<(record)
      @view.Modify(MSI::ViewModifyInsert, record)
    end
    
    def each
      until (r = @view.Fetch) == nil
        yield Record.new(r, types).to_a
      end
    end
    
  end

end