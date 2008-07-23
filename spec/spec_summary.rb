
describe 'MSI::Summary' do
  
  before do
    @summary = MSI::Summary.new('spec/msi/UISample.msi')
  end
  
  after do
    @summary.close
  end
  
  it 'should have a title' do
    title = @summary.title
    title.should ==  "Installation Database"
  end
  
  it 'should have a subject' do
    subject = @summary.subject
    subject.should == "Put Product Name here"
  end
  
  it 'should have an author' do
    author = @summary.author
    author.should == "Microsoft Corporation"
  end

  it 'should have a template' do
    template = @summary.template
    template.should == ";1033"
  end
  
  it 'should have a revision' do
    revision = @summary.revision
    revision.should == "{Put Package Code GUID Here}"
  end
  
  it 'should have a word_count' do
    word_count = @summary.word_count
    word_count.should == 2
  end

  it 'should have a page_count' do
    page_count = @summary.page_count
    page_count.should == 100
  end

  it 'should have an application name' do
    application = @summary.application
    application.should == "Windows Installer"
  end

  describe '.update' do
  
    before do
      @msi = 'spec/msi/spec_summary.msi'
      db = MSI::Database.new(@msi)
      db.close
    end
    
    after do
      File.delete(@msi) if File.exist?(@msi)
    end
  
    it 'should be able to update' do

      MSI::Summary.update( @msi) do |s|
        s.title       = 'Summary Test Database'
        s.subject     = 'Fake Product'
        s.author      = 'Gordon Thiesfeld'
        s.application = 'wiry - The Windows Installer Ruby librarY'
      end
      
      s = MSI::Summary.new( @msi)
      s.title.should       == 'Summary Test Database'
      s.subject.should     == 'Fake Product'
      s.author.should      == 'Gordon Thiesfeld'
      s.application.should == 'wiry - The Windows Installer Ruby librarY'
    end
  end
  
end