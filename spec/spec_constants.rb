
describe 'MSI constants' do

  it "should load constants from the Installer COM object" do
    MSI::OpenDatabaseModeReadOnly.should == 0
    MSI::OpenDatabaseModeCreate == 3
  end
  
end