
require 'win32ole'

module MSI

  def self.conn
    @conn = WIN32OLE.new('WIndowsInstaller.Installer')
  end

  module Constants
    # a module used only to create the MSI constants
  end
  
  DATASIZEMASK     = 0x00ff
  TYPE_VALID       = 0x0100
  TYPE_LOCALIZABLE = 0x0200
  
  TYPEMASK         = 0x0c00
  TYPE_LONG        = 0x0000
  TYPE_SHORT       = 0x0400
  TYPE_STRING      = 0x0c00
  TYPE_BINARY      = 0x0800
  
  TYPE_NULLABLE    = 0x1000
  TYPE_KEY         = 0x2000
  
  # XXX temporary, localizable?
  KNOWNBITS = DATASIZEMASK | TYPE_VALID | TYPE_LOCALIZABLE | \
              TYPEMASK | TYPE_NULLABLE | TYPE_KEY

end

if MSI::Constants.constants.empty?
  WIN32OLE.const_load('WindowsInstaller.Installer' , MSI::Constants)
  MSI::Constants.constants.each{|i|
    if i =~ /^Msi(.+)/
      MSI.const_set($1, MSI::Constants.const_get(i))
    end
  }
end