describe 'MSI::Sequence' do
  
  before :each do
    @db = MSI::Database.new('../msi/sequence_generate.msi')
  end
  
  after do
    @db.close
  end
  
  describe '.generate' do
    it "should return a hash containing a dump of all tables" do
      @db.create_table(:Error) do |t|
        t.short :error, :null => false, :key => true
        t.char :message, :local => true
      end
      
      @db[:Error] << [0, '{{Fatal error: }}']
            
      sequence = MSI::Sequence.generate(@db)
      sequence.should == {"Error"=>[[0, "{{Fatal error: }}"]]}
    end
  end
  
end