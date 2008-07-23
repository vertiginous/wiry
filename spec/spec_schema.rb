
describe 'MSI::Schema' do

  before :each do
    # @msi = ( 'spec/msi/UISample.msi' )
    # @db = MSI::Database.connect(@msi)
  end
  
  after :each do
    # @db.close
  end
  
  describe '.[]' do
    it 'should return the schema for the give table' do
      test = [
       [:short, :error, {:null=>false}, {:key=>true}], 
       [:char, :message, {:local=>true}]
      ]
      MSI::Schema['Error'].should == test
    end  
  end
  
  describe '.tables' do
    it 'should return an array of tables' do
      tables = MSI::Schema.tables
      tables.should be_an_instance_of( Array )
      tables.should include('Error')
      tables.should include('ComboBox')
    end
  end
  
  describe '#to_s' do
    it "should return a sql string" do
      sql =  MSI::Schema.new('Stuff')
      str = "CREATE TABLE Stuff ()"
      sql.to_s.should == str
    end
    
    it "should have a column name and column type" do
      sql =  MSI::Schema.new('Stuff') do |t|
        t.char :name
      end
      str = "CREATE TABLE Stuff (`Name` CHAR)"
      sql.to_s.should == str
    end 
    
    it "should return NOT NULL when :null => false" do
      sql =  MSI::Schema.new('Stuff') do |t|
        t.char :name, :null => false
      end
      str = "CREATE TABLE Stuff (`Name` CHAR NOT NULL)"
      sql.to_s.should == str
    end 
    
    it "should return CHAR(size) :size => int" do
      sql =  MSI::Schema.new('Stuff') do |t|
        t.char :name, :size => 25
      end
      str = "CREATE TABLE Stuff (`Name` CHAR(25))"
      sql.to_s.should == str
    end 
     
    it "should return a PRIMARY KEY when :key => true" do
      sql =  MSI::Schema.new('Stuff') do |t|
        t.char :name, :key => true
      end
      str = "CREATE TABLE Stuff (`Name` CHAR PRIMARY KEY `Name`)"
      sql.to_s.should == str
    end
   
    it "should return a LOCALIZABLE when :local => true" do
      sql =  MSI::Schema.new('Stuff') do |t|
        t.char :name, :local => true
      end
      str = "CREATE TABLE Stuff (`Name` CHAR LOCALIZABLE)"
      sql.to_s.should == str
    end
    
    it "should return comma seperated columns and keys" do
      sql =  MSI::Schema.new('Stuff') do |t|
        t.char :name, :key => true
        t.char :thing, :key => true
      end
      str = "CREATE TABLE Stuff (`Name` CHAR, `Thing` CHAR PRIMARY KEY `Name`, `Thing`)"
      sql.to_s.should == str
    end
  end
  
  describe '#dump' do
    before{ @db_generate = MSI::Database.connect('spec/msi/Schema.msi') }
    
    after{ @db_generate.close } 
    
    it "should return a schema hash" do
      schema = MSI::Schema.dump(@db_generate)
      schema.should be_an_instance_of( Hash )
      require 'yaml'
      # File.open('lib/schema/UISample_schema.yml', 'w+'){|f| f.write YAML.dump(schema) }
      test = YAML.load( File.read('lib/schema/schema.yml') )
      schema.should == test  
    end
  end

end