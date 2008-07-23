describe 'MSI::Sequence' do
  
  before :each do
    @msi = 'spec/msi/sequence_generate.msi'
    @db = MSI::Database.new(@msi)
  end
  
  after do
    @db.close
    File.delete(@msi) if File.exist?(@msi)    
  end
  
  describe '.generate' do
    it "should return a hash containing a dump of all tables" do
      @db.create_tables(:Error => [
          [:short, :error, {:null => false}, {:key => true}],
          [:char, :message, {:local => true}]
        ]
      )
      
      @db[:Error] << [0, '{{Fatal error: }}']
            
      sequence = MSI::Sequence.generate(@db)
      sequence.should == {"Error"=>[[0, "{{Fatal error: }}"]]}
    end
  end
  
end