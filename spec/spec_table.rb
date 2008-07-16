
describe 'MSI::Table' do

  before :each do
    @db = MSI::Database.connect('../msi/UISample.msi')
    @errors = @db[:Error]
  end
  
  after :each do
    @db.close
  end

  describe '#all' do
    it "should return an MSI::Table" do
      v = @errors.all
      v.should be_an_instance_of( MSI::View )
      v.to_a.size.should == 166
      v.close
    end
  end
  
  describe '#select' do
    it "should execute a query against the table object" do
      v = @errors.select('Message')
      v.should be_an_instance_of( MSI::View )
      v.to_a.size.should == 166
      v.to_a.first.should ==  ["{{Fatal error: }}"]
      v.close
      v = @errors.select('Error','Message')
      v.to_a.first.should ==  [0, "{{Fatal error: }}"]
      v.close
    end
  end
  
  describe '#insert' do
    it "should insert a row into the table" do
      db = MSI::Database.new('../msi/table_insert.msi')
      eval(File.read('lib/schema/schema.rb'))
      @schema.each{|i| db.do(i.to_s) }
      db[:Error].insert(0, '{{Fatal error: }}')
      db[:Error].all.to_a.should == [[0, '{{Fatal error: }}']]
      db.close      
    end
  end
     
end