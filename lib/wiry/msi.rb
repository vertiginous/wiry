
require 'win32ole'

module MSI

  def self.conn
    @conn = WIN32OLE.new('WIndowsInstaller.Installer')
  end

end