
describe 'MSI::Table' do

  before do
    @db = MSI::Database.connect('spec/msi/UISample.msi')
    @errors = @db[:Error]
  end
  
  after do
    @db.close
  end

  describe '#all' do
   
    before{ @view = @errors.all }
    
    it "should return an Array" do
      @view.should be_an_instance_of( Array )
      @view.to_a.size.should == 166
    end

  end
  
  describe '#select' do
    
    before{ @view = @errors.select('Message') }
    
    
    it "should execute a query against the table object" do
      @view.should be_an_instance_of( Array )
      @view.size.should == 166
      @view.first.should ==  ["{{Fatal error: }}"]
      @view = @errors.select('Error','Message')
      @view.to_a.first.should ==  [0, "{{Fatal error: }}"]
    end
  end
  
  describe '#insert' do

    before do
      @msi = 'spec/msi/table_insert.msi'
      @db_insert = MSI::Database.new(@msi)
      @db_insert.create_tables('Error' => [
          [:short, :error, {:null => false}, {:key => true}],
          [:char, :message, {:local => true}]
        ]
      )
    end
    
    after do
      @db_insert.close
      File.delete(@msi) if File.exist?(@msi)
    end

    it "should insert a row into the table" do
      @db_insert[:Error].insert(0, '{{Fatal error: }}')
      @db_insert[:Error].all.to_a.should == [[0, '{{Fatal error: }}']]
    end
  end
     
end