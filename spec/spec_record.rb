
describe 'MSI::Record' do
  
  before :each do
    r = MSI.conn.CreateRecord(3)
    @record = MSI::Record.new(r)
    @db = MSI::Database.connect('../msi/UISample.msi')
    @view = @db.execute('SELECT * FROM Error')
  end
  
  after do
    @view.close
    @db.close
  end
  
  describe '#size' do
    it "should return an integer" do
      @record.size.should == 3
    end
  end
  
  describe '#to_a' do
    it "should return an array" do
      @record.to_a.should == ['','','']
    end
  end
  
end