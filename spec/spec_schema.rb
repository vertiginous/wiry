
describe 'MSI::Schema' do

  before :each do
  
  end
  
  after :each do

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
  
  describe '#generate' do
    it "should return a ruby schema script as a string" do
      db = MSI::Database.connect('../msi/Schema.msi')
      schema = MSI::Schema.generate(db)
      test = File.read('lib/schema/schema.rb') 
        s =  "@schema = [\n"
        s <<  schema.sort.join(",\n\n")
        s <<  "\n]\n" 

      s.should == test
      db.close      
    end
  end

end