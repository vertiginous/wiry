module MSI

  class Summary
    
    # Summary Info Property IDs
    PID_CODEPAGE=1
    PID_TITLE=2
    PID_SUBJECT=3
    PID_AUTHOR=4
    PID_KEYWORDS=5
    PID_COMMENTS=6
    PID_TEMPLATE=7
    PID_LASTAUTHOR=8
    PID_REVNUMBER=9
    PID_LASTPRINTED=11
    PID_CREATE_DTM=12
    PID_LASTSAVE_DTM=13
    PID_PAGECOUNT=14
    PID_WORDCOUNT=15
    PID_CHARCOUNT=16
    PID_APPNAME=18
    PID_SECURITY=19
    
    def initialize(name, size=nil)
      @summary = MSI.conn.SummaryInformation(name, size)
    end
    
    def update
      @summary.Persist
    end
    
    def close
      @summary.ole_free
      @summary = nil
    end
    
    def self.update(name, size=20)
      begin
        summary = new(name, size)
      rescue WIN32OLERuntimeError
        raise MSI::Record.new(MSI.conn.LastErrorRecord).to_a.inspect
      end
      yield summary
      summary.update
      summary.close      
    end
    
    def title=(t="Installation Database")
      @summary['Property', PID_TITLE] = t
    end
    
    def title
      @summary['Property', PID_TITLE]
    end
    
    def subject=(s)
      @summary['Property', PID_SUBJECT] = s
    end
    
    def subject
      @summary['Property', PID_SUBJECT]
    end
    
    def author=(a)
      @summary['Property', PID_AUTHOR] = a
    end
    
    def author
      @summary['Property', PID_AUTHOR]
    end
    
    def template=(t)
      @summary['Property', PID_TEMPLATE] = t
    end
    
    def template
      @summary['Property', PID_TEMPLATE]
    end
    
    def revision=(r)
      @summary['Property', PID_REVNUMBER] = r # gen_uuid()
    end 
        
    def revision
      @summary['Property', PID_REVNUMBER]
    end
    
    def word_count=(w)
      @summary['Property', PID_WORDCOUNT] = w # 2 
    end
    
    def word_count
      @summary['Property', PID_WORDCOUNT]
    end
    
    def page_count=(p)
      @summary['Property', PID_PAGECOUNT] = p # 200
    end
    
    def page_count
      @summary['Property', PID_PAGECOUNT]
    end
    
    def application=(a)
      @summary['Property', PID_APPNAME] = a # "Python MSI Library"
    end
    
    def application
      @summary['Property', PID_APPNAME]
    end
        
  end
  
end