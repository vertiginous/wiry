module MSI
  
  class Sequence < Hash
  
    def self.generate(db)
      h = new{ |h,k| h[k] = [] }
      db[:_Tables].select('Name').to_a.each do |table|
        h[*table] = db[table].all.to_a
      end
      h
    end
  
  end

end