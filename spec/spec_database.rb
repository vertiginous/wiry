
describe 'MSI::Database' do

  before :each do
    @db = MSI::Database.connect('../msi/schema.msi')
  end
  
  after :each do
    @db.close
  end

  describe '#open' do
    it 'should be able to connect to existing databases' do
      @db.instance_variable_get('@db').should be_an_instance_of( WIN32OLE )
    end
  end
  
  describe '#new' do
    it 'should be able to create a new database' do
      db = MSI::Database.new('../msi/test.msi')
      db.instance_variable_get('@db').should be_an_instance_of( WIN32OLE )
      db.close
    end
  end
  
  describe '#close' do
    it "should disconnect from the database" do
      db = MSI::Database.connect('../msi/sequence.msi')
      db.close
      lambda{ 
        db = MSI::Database.connect('../msi/sequence.msi')
        db.close
      }.should_not raise_error
    end
  end
  
  describe '#[]' do
    it "should return an MSI::Table" do
      @db[:Error].should be_an_instance_of( MSI::Table )
    end
  end
  
  describe '#create_table' do
    it 'should create a table' do
      msi = '../msi/test2.msi'
      File.delete(msi) if File.exist?(msi)
      new_db = MSI::Database.new(msi)
      v = new_db.create_table('Error') do |t|
        t.short 'Error', :null => false, :key => true
        t.char 'Message', :local => true
      end
      v.close
      new_db.do('SELECT * FROM _Columns').to_a.should ==  [["Error", 1, "Error", 9474], ["Error", 2, "Message", 7936]]
      new_db.close
    end
  end

end