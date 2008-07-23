
describe 'MSI::Database' do

  before :each do
    @db = MSI::Database.connect('spec/msi/schema.msi')
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
    before do
      @msi = 'spec/msi/database_new.msi'
    end
    
    after do
      File.delete(@msi) if File.exist?(@msi)
    end
    
    it 'should be able to create a new database' do
      db = MSI::Database.new(@msi)
      db.instance_variable_get('@db').should be_an_instance_of( WIN32OLE )
      db.close
    end
  end
  
  describe '#close' do
    it "should disconnect from the database" do
      db = MSI::Database.connect('spec/msi/sequence.msi')
      db.close
      lambda{ 
        db = MSI::Database.connect('spec/msi/sequence.msi')
        db.close
      }.should_not raise_error
    end
    
    it "should release the file handle" do
      db = MSI::Database.new('spec/msi/release.msi')
      db.close
      lambda{ File.delete('spec/msi/release.msi') }.should_not raise_error
    end
    
    it "should release the file handle" do
      db = MSI::Database.new('spec/msi/release.msi')
      view = db.create_tables( 'Error' => [
          [:short, 'Error', {:null => false}, {:key => true}],
          [:char, 'Message', {:local => true}]
        ]
      )
      db.close
      lambda{ File.delete('spec/msi/release.msi') }.should_not raise_error
    end
    
    it "should release the file handle" do
      db = MSI::Database.new('spec/msi/release.msi')
      view = db.create_tables('Error' => [
          [:short, 'Error', {:null => false}, {:key => true}],
          [:char, 'Message', {:local => true}]
        ]
      )
      db[:Error] << [0, '{{Error Messag}}']
      v = db[:Error].all
      db.close
      lambda{ File.delete('spec/msi/release.msi') }.should_not raise_error
    end
    
  end
  
  describe '#[]' do
    it "should return an MSI::Table" do
      @db[:Error].should be_an_instance_of( MSI::Table )
    end
  end
  
  describe '#create_tables' do
    before do
      @msi = 'spec/msi/test2.msi'
      @new_db = MSI::Database.new(@msi)
    end
    
    after do
      @new_db.close
      File.delete(@msi) if File.exist?(@msi)
    end
    
    
    it 'should create a table' do
      
      @view = @new_db.create_table('Error' =>
        [
          [:short, 'Error', {:null => false}, {:key => true}],
          [:char, 'Message', {:local => true}]
        ]
      )
      
      columns = @new_db.do('SELECT * FROM _Columns')
      
      columns.to_a.should ==  [["Error", 1, "Error", 9474], ["Error", 2, "Message", 7936]]
      
      columns.close
    end
    
    it 'should allow symbols or string as table names' do
      @view = @new_db.create_tables(:Error =>
        [
          [:short, 'Error', {:null => false}, {:key => true}],
          [:char, 'Message', {:local => true}]
        ]
      )
      
      columns = @new_db.do('SELECT * FROM _Columns')
      
      columns.to_a.should ==  [["Error", 1, "Error", 9474], ["Error", 2, "Message", 7936]]
      
      columns.close
    end
  end
  
  describe '#create_tables' do
    it 'should create tables'
  end
  
  describe '#drop_table' do
  
    before do
      @msi = 'spec/msi/test2.msi'
      @new_db = MSI::Database.new(@msi)
      @new_db.create_tables(:Error =>
        [
          [:short, 'Error', {:null => false}, {:key => true}],
          [:char, 'Message', {:local => true}]
        ]
      )
    end
    
    after do
      @new_db.close
      File.delete(@msi) if File.exist?(@msi)
    end
    
  
    it 'should remove a table from the database' do
      @new_db.drop_table(:Error)
    end
  end
  
  describe '#drop_table' do
    it 'should remove tables from the database'
  end
  
  describe '#tables' do
    it 'should return an array of table names' do
      tables = @db.tables
      tables.should be_an_instance_of Array
      tables.size.should == 93
      tables.should include('Error')
      tables.should include('Class')
      tables.should include('File')
      tables.should include('Icon')
    end
  end
  
end