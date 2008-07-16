
describe 'MSI::View' do
  
  before :each do
    @db = MSI::Database.connect('../msi/UISample.msi')
    @view = @db.execute('SELECT * FROM Error')
  end
  
  after do
    @view.close
    @db.close
  end
  
  describe '#columns' do
    it "should return an array of column names"  do
      @view.columns.should == ['Error','Message'] 
    end
  end
  
  describe '#types' do
    it "should return an array of column types"  do 
      @view.types.should ==  ["i2", "L0"] 
    end
  end

  describe '#each' do
    it "should iterate over all records" do
      a = 0
      @view.each{|i| a +=1}
      a.should == 166
    end
  end

  describe '#map' do
    it "should iterate over all records" do
      a = 0
      m = @view.map{|i| a +=1}
      m.first.should == 1
      m.last.should == 166
      m.size.should == 166
    end
  end
  
  describe '#to_a' do
    it 'should return an array of arrays' do
      m = @view.to_a
      m.size.should == 166
      m.all?{|i| i.class == Array }.should be_true
    end
  end

end