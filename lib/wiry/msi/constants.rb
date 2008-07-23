module MSI

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

  class Schema
    @@schema = {
     "File"=>
      [[:char, :file, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :filename, {:null=>false}, {:local=>true}],
       [:long, :filesize, {:null=>false}],
       [:char, :version],
       [:char, :language],
       [:short, :attributes],
       [:short, :sequence, {:null=>false}]],
     "Control"=>
      [[:char, :dialog_, {:null=>false}, {:key=>true}],
       [:char, :control, {:null=>false}, {:key=>true}],
       [:char, :type, {:null=>false}],
       [:short, :x, {:null=>false}],
       [:short, :y, {:null=>false}],
       [:short, :width, {:null=>false}],
       [:short, :height, {:null=>false}],
       [:long, :attributes],
       [:char, :property],
       [:char, :text, {:local=>true}],
       [:char, :control_next],
       [:char, :help, {:local=>true}]],
     "_Validation"=>
      [[:char, :table, {:null=>false}, {:key=>true}],
       [:char, :column, {:null=>false}, {:key=>true}],
       [:char, :nullable, {:null=>false}],
       [:long, :minvalue],
       [:long, :maxvalue],
       [:char, :keytable],
       [:short, :keycolumn],
       [:char, :category],
       [:char, :set],
       [:char, :description]],
     "Binary"=>
      [[:char, :name, {:null=>false}, {:key=>true}],
       [:object, :data, {:null=>false}]],
     "PublishComponent"=>
      [[:char, :componentid, {:null=>false}, {:key=>true}],
       [:char, :qualifier, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}, {:key=>true}],
       [:char, :appdata, {:local=>true}],
       [:char, :feature_, {:null=>false}]],
     "LockPermissions"=>
      [[:char, :lockobject, {:null=>false}, {:key=>true}],
       [:char, :table, {:null=>false}, {:key=>true}],
       [:char, :domain, {:key=>true}],
       [:char, :user, {:null=>false}, {:key=>true}],
       [:long, :permission]],
     "InstallUISequence"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:char, :condition],
       [:short, :sequence]],
     "ListView"=>
      [[:char, :property, {:null=>false}, {:key=>true}],
       [:short, :order, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}],
       [:char, :text, {:local=>true}],
       [:char, :binary_]],
     "ReserveCost"=>
      [[:char, :reservekey, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :reservefolder],
       [:long, :reservelocal, {:null=>false}],
       [:long, :reservesource, {:null=>false}]],
     "ODBCSourceAttribute"=>
      [[:char, :datasource_, {:null=>false}, {:key=>true}],
       [:char, :attribute, {:null=>false}, {:key=>true}],
       [:char, :value, {:local=>true}]],
     "AdvtUISequence"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:char, :condition],
       [:short, :sequence]],
     "MsiAssembly"=>
      [[:char, :component_, {:null=>false}, {:key=>true}],
       [:char, :feature_, {:null=>false}],
       [:char, :file_manifest],
       [:char, :file_application],
       [:short, :attributes]],
     "DrLocator"=>
      [[:char, :signature_, {:null=>false}, {:key=>true}],
       [:char, :parent, {:key=>true}],
       [:char, :path, {:key=>true}],
       [:short, :depth]],
     "Font"=>[[:char, :file_, {:null=>false}, {:key=>true}], [:char, :fonttitle]],
     "CreateFolder"=>
      [[:char, :directory_, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}, {:key=>true}]],
     "ListBox"=>
      [[:char, :property, {:null=>false}, {:key=>true}],
       [:short, :order, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}],
       [:char, :text, {:local=>true}]],
     "Feature"=>
      [[:char, :feature, {:null=>false}, {:key=>true}],
       [:char, :feature_parent],
       [:char, :title, {:local=>true}],
       [:char, :description, {:local=>true}],
       [:short, :display],
       [:short, :level, {:null=>false}],
       [:char, :directory_],
       [:short, :attributes, {:null=>false}]],
     "AdvtExecuteSequence"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:char, :condition],
       [:short, :sequence]],
     "Component"=>
      [[:char, :component, {:null=>false}, {:key=>true}],
       [:char, :componentid],
       [:char, :directory_, {:null=>false}],
       [:short, :attributes, {:null=>false}],
       [:char, :condition],
       [:char, :keypath]],
     "MsiPatchHeaders"=>
      [[:char, :streamref, {:null=>false}, {:key=>true}],
       [:object, :header, {:null=>false}]],
     "TextStyle"=>
      [[:char, :textstyle, {:null=>false}, {:key=>true}],
       [:char, :facename, {:null=>false}],
       [:short, :size, {:null=>false}],
       [:long, :color],
       [:short, :stylebits]],
     "RegLocator"=>
      [[:char, :signature_, {:null=>false}, {:key=>true}],
       [:short, :root, {:null=>false}],
       [:char, :key, {:null=>false}],
       [:char, :name],
       [:short, :type]],
     "FileSFPCatalog"=>
      [[:char, :file_, {:null=>false}, {:key=>true}],
       [:char, :sfpcatalog_, {:null=>false}, {:key=>true}]],
     "SelfReg"=>[[:char, :file_, {:null=>false}, {:key=>true}], [:short, :cost]],
     "CustomAction"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:short, :type, {:null=>false}],
       [:char, :source],
       [:char, :target],
       [:long, :extendedtype]],
     "AppId"=>
      [[:char, :appid, {:null=>false}, {:key=>true}],
       [:char, :remoteservername],
       [:char, :localservice],
       [:char, :serviceparameters],
       [:char, :dllsurrogate],
       [:short, :activateatstorage],
       [:short, :runasinteractiveuser]],
     "Billboard"=>
      [[:char, :billboard, {:null=>false}, {:key=>true}],
       [:char, :feature_, {:null=>false}],
       [:char, :action],
       [:short, :ordering]],
     "MsiPackageCertificate"=>
      [[:char, :packagecertificate, {:null=>false}, {:key=>true}],
       [:char, :digitalcertificate_, {:null=>false}]],
     "BindImage"=>[[:char, :file_, {:null=>false}, {:key=>true}], [:char, :path]],
     "Class"=>
      [[:char, :clsid, {:null=>false}, {:key=>true}],
       [:char, :context, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}, {:key=>true}],
       [:char, :progid_default],
       [:char, :description, {:local=>true}],
       [:char, :appid_],
       [:char, :filetypemask],
       [:char, :icon_],
       [:short, :iconindex],
       [:char, :definprochandler],
       [:char, :argument],
       [:char, :feature_, {:null=>false}],
       [:short, :attributes]],
     "ODBCDataSource"=>
      [[:char, :datasource, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :description, {:null=>false}],
       [:char, :driverdescription, {:null=>false}],
       [:short, :registration, {:null=>false}]],
     "Icon"=>
      [[:char, :name, {:null=>false}, {:key=>true}],
       [:object, :data, {:null=>false}]],
     "ProgId"=>
      [[:char, :progid, {:null=>false}, {:key=>true}],
       [:char, :progid_parent],
       [:char, :class_],
       [:char, :description, {:local=>true}],
       [:char, :icon_],
       [:short, :iconindex]],
     "BBControl"=>
      [[:char, :billboard_, {:null=>false}, {:key=>true}],
       [:char, :bbcontrol, {:null=>false}, {:key=>true}],
       [:char, :type, {:null=>false}],
       [:short, :x, {:null=>false}],
       [:short, :y, {:null=>false}],
       [:short, :width, {:null=>false}],
       [:short, :height, {:null=>false}],
       [:long, :attributes],
       [:char, :text, {:local=>true}]],
     "Shortcut"=>
      [[:char, :shortcut, {:null=>false}, {:key=>true}],
       [:char, :directory_, {:null=>false}],
       [:char, :name, {:null=>false}, {:local=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :target, {:null=>false}],
       [:char, :arguments],
       [:char, :description, {:local=>true}],
       [:short, :hotkey],
       [:char, :icon_],
       [:short, :iconindex],
       [:short, :showcmd],
       [:char, :wkdir],
       [:char, :displayresourcedll],
       [:long, :displayresourceid],
       [:char, :descriptionresourcedll],
       [:long, :descriptionresourceid]],
     "MoveFile"=>
      [[:char, :filekey, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :sourcename, {:local=>true}],
       [:char, :destname, {:local=>true}],
       [:char, :sourcefolder],
       [:char, :destfolder, {:null=>false}],
       [:short, :options, {:null=>false}]],
     "MsiDigitalSignature"=>
      [[:char, :table, {:null=>false}, {:key=>true}],
       [:char, :signobject, {:null=>false}, {:key=>true}],
       [:char, :digitalcertificate_, {:null=>false}],
       [:object, :hash]],
     "Directory"=>
      [[:char, :directory, {:null=>false}, {:key=>true}],
       [:char, :directory_parent],
       [:char, :defaultdir, {:null=>false}, {:local=>true}]],
     "Environment"=>
      [[:char, :environment, {:null=>false}, {:key=>true}],
       [:char, :name, {:null=>false}, {:local=>true}],
       [:char, :value, {:local=>true}],
       [:char, :component_, {:null=>false}]],
     "Media"=>
      [[:short, :diskid, {:null=>false}, {:key=>true}],
       [:short, :lastsequence, {:null=>false}],
       [:char, :diskprompt, {:local=>true}],
       [:char, :cabinet],
       [:char, :volumelabel],
       [:char, :source]],
     "ActionText"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:char, :description, {:local=>true}],
       [:char, :template, {:local=>true}]],
     "MsiPatchMetadata"=>
      [[:char, :company, {:key=>true}],
       [:char, :property, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}, {:local=>true}]],
     "Upgrade"=>
      [[:char, :upgradecode, {:null=>false}, {:key=>true}],
       [:char, :versionmin, {:key=>true}],
       [:char, :versionmax, {:key=>true}],
       [:char, :language, {:key=>true}],
       [:long, :attributes, {:null=>false}, {:key=>true}],
       [:char, :remove],
       [:char, :actionproperty, {:null=>false}]],
     "ODBCTranslator"=>
      [[:char, :translator, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :description, {:null=>false}],
       [:char, :file_, {:null=>false}],
       [:char, :file_setup]],
     "CheckBox"=>
      [[:char, :property, {:null=>false}, {:key=>true}], [:char, :value]],
     "InstallExecuteSequence"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:char, :condition],
       [:short, :sequence]],
     "SFPCatalog"=>
      [[:char, :sfpcatalog, {:null=>false}, {:key=>true}],
       [:object, :catalog, {:null=>false}],
       [:char, :dependency]],
     "Signature"=>
      [[:char, :signature, {:null=>false}, {:key=>true}],
       [:char, :filename, {:null=>false}],
       [:char, :minversion],
       [:char, :maxversion],
       [:long, :minsize],
       [:long, :maxsize],
       [:long, :mindate],
       [:long, :maxdate],
       [:char, :languages]],
     "MIME"=>
      [[:char, :contenttype, {:null=>false}, {:key=>true}],
       [:char, :extension_, {:null=>false}],
       [:char, :clsid]],
     "AdminUISequence"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:char, :condition],
       [:short, :sequence]],
     "Dialog"=>
      [[:char, :dialog, {:null=>false}, {:key=>true}],
       [:short, :hcentering, {:null=>false}],
       [:short, :vcentering, {:null=>false}],
       [:short, :width, {:null=>false}],
       [:short, :height, {:null=>false}],
       [:long, :attributes],
       [:char, :title, {:local=>true}],
       [:char, :control_first, {:null=>false}],
       [:char, :control_default],
       [:char, :control_cancel]],
     "EventMapping"=>
      [[:char, :dialog_, {:null=>false}, {:key=>true}],
       [:char, :control_, {:null=>false}, {:key=>true}],
       [:char, :event, {:null=>false}, {:key=>true}],
       [:char, :attribute, {:null=>false}]],
     "MsiPatchCertificate"=>
      [[:char, :patchcertificate, {:null=>false}, {:key=>true}],
       [:char, :digitalcertificate_, {:null=>false}, {:key=>true}]],
     "RemoveIniFile"=>
      [[:char, :removeinifile, {:null=>false}, {:key=>true}],
       [:char, :filename, {:null=>false}, {:local=>true}],
       [:char, :dirproperty],
       [:char, :section, {:null=>false}, {:local=>true}],
       [:char, :key, {:null=>false}, {:local=>true}],
       [:char, :value, {:local=>true}],
       [:short, :action, {:null=>false}],
       [:char, :component_, {:null=>false}]],
     "MsiFileHash"=>
      [[:char, :file_, {:null=>false}, {:key=>true}],
       [:short, :options, {:null=>false}],
       [:long, :hashpart1, {:null=>false}],
       [:long, :hashpart2, {:null=>false}],
       [:long, :hashpart3, {:null=>false}],
       [:long, :hashpart4, {:null=>false}]],
     "MsiPatchOldAssemblyFile"=>
      [[:char, :file_, {:null=>false}, {:key=>true}],
       [:char, :assembly_, {:null=>false}, {:key=>true}]],
     "ServiceControl"=>
      [[:char, :servicecontrol, {:null=>false}, {:key=>true}],
       [:char, :name, {:null=>false}, {:local=>true}],
       [:short, :event, {:null=>false}],
       [:char, :arguments, {:local=>true}],
       [:short, :wait],
       [:char, :component_, {:null=>false}]],
     "ControlEvent"=>
      [[:char, :dialog_, {:null=>false}, {:key=>true}],
       [:char, :control_, {:null=>false}, {:key=>true}],
       [:char, :event, {:null=>false}, {:key=>true}],
       [:char, :argument, {:null=>false}, {:key=>true}],
       [:char, :condition, {:key=>true}],
       [:short, :ordering]],
     "Condition"=>
      [[:char, :feature_, {:null=>false}, {:key=>true}],
       [:short, :level, {:null=>false}, {:key=>true}],
       [:char, :condition]],
     "ODBCDriver"=>
      [[:char, :driver, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :description, {:null=>false}],
       [:char, :file_, {:null=>false}],
       [:char, :file_setup]],
     "ServiceInstall"=>
      [[:char, :serviceinstall, {:null=>false}, {:key=>true}],
       [:char, :name, {:null=>false}],
       [:char, :displayname, {:local=>true}],
       [:long, :servicetype, {:null=>false}],
       [:long, :starttype, {:null=>false}],
       [:long, :errorcontrol, {:null=>false}],
       [:char, :loadordergroup],
       [:char, :dependencies],
       [:char, :startname],
       [:char, :password],
       [:char, :arguments],
       [:char, :component_, {:null=>false}],
       [:char, :description, {:local=>true}]],
     "TypeLib"=>
      [[:char, :libid, {:null=>false}, {:key=>true}],
       [:short, :language, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}, {:key=>true}],
       [:long, :version],
       [:char, :description, {:local=>true}],
       [:char, :directory_],
       [:char, :feature_, {:null=>false}],
       [:long, :cost]],
     "UIText"=>
      [[:char, :key, {:null=>false}, {:key=>true}],
       [:char, :text, {:local=>true}]],
     "ControlCondition"=>
      [[:char, :dialog_, {:null=>false}, {:key=>true}],
       [:char, :control_, {:null=>false}, {:key=>true}],
       [:char, :action, {:null=>false}, {:key=>true}],
       [:char, :condition, {:null=>false}, {:key=>true}]],
     "DuplicateFile"=>
      [[:char, :filekey, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :file_, {:null=>false}],
       [:char, :destname, {:local=>true}],
       [:char, :destfolder]],
     "IsolatedComponent"=>
      [[:char, :component_shared, {:null=>false}, {:key=>true}],
       [:char, :component_application, {:null=>false}, {:key=>true}]],
     "Complus"=>
      [[:char, :component_, {:null=>false}, {:key=>true}],
       [:short, :exptype, {:key=>true}]],
     "Property"=>
      [[:char, :property, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}, {:local=>true}]],
     "ODBCAttribute"=>
      [[:char, :driver_, {:null=>false}, {:key=>true}],
       [:char, :attribute, {:null=>false}, {:key=>true}],
       [:char, :value, {:local=>true}]],
     "Verb"=>
      [[:char, :extension_, {:null=>false}, {:key=>true}],
       [:char, :verb, {:null=>false}, {:key=>true}],
       [:short, :sequence],
       [:char, :command, {:local=>true}],
       [:char, :argument, {:local=>true}]],
     "Registry"=>
      [[:char, :registry, {:null=>false}, {:key=>true}],
       [:short, :root, {:null=>false}],
       [:char, :key, {:null=>false}, {:local=>true}],
       [:char, :name, {:local=>true}],
       [:char, :value, {:local=>true}],
       [:char, :component_, {:null=>false}]],
     "LaunchCondition"=>
      [[:char, :condition, {:null=>false}, {:key=>true}],
       [:char, :description, {:null=>false}, {:local=>true}]],
     "MsiPatchSequence"=>
      [[:char, :patchfamily, {:null=>false}, {:key=>true}],
       [:char, :productcode, {:key=>true}],
       [:char, :sequence, {:null=>false}],
       [:long, :attributes]],
     "IniFile"=>
      [[:char, :inifile, {:null=>false}, {:key=>true}],
       [:char, :filename, {:null=>false}, {:local=>true}],
       [:char, :dirproperty],
       [:char, :section, {:null=>false}, {:local=>true}],
       [:char, :key, {:null=>false}, {:local=>true}],
       [:char, :value, {:null=>false}, {:local=>true}],
       [:short, :action, {:null=>false}],
       [:char, :component_, {:null=>false}]],
     "AdminExecuteSequence"=>
      [[:char, :action, {:null=>false}, {:key=>true}],
       [:char, :condition],
       [:short, :sequence]],
     "AppSearch"=>
      [[:char, :property, {:null=>false}, {:key=>true}],
       [:char, :signature_, {:null=>false}, {:key=>true}]],
     "RadioButton"=>
      [[:char, :property, {:null=>false}, {:key=>true}],
       [:short, :order, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}],
       [:short, :x, {:null=>false}],
       [:short, :y, {:null=>false}],
       [:short, :width, {:null=>false}],
       [:short, :height, {:null=>false}],
       [:char, :text, {:local=>true}],
       [:char, :help, {:local=>true}]],
     "MsiEmbeddedChainer"=>
      [[:char, :msiembeddedchainer, {:null=>false}, {:key=>true}],
       [:char, :condition],
       [:char, :commandline],
       [:char, :source, {:null=>false}],
       [:short, :type, {:null=>false}]],
     "IniLocator"=>
      [[:char, :signature_, {:null=>false}, {:key=>true}],
       [:char, :filename, {:null=>false}],
       [:char, :section, {:null=>false}],
       [:char, :key, {:null=>false}],
       [:short, :field],
       [:short, :type]],
     "CompLocator"=>
      [[:char, :signature_, {:null=>false}, {:key=>true}],
       [:char, :componentid, {:null=>false}],
       [:short, :type]],
     "ComboBox"=>
      [[:char, :property, {:null=>false}, {:key=>true}],
       [:short, :order, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}],
       [:char, :text, {:local=>true}]],
     "Patch"=>
      [[:char, :file_, {:null=>false}, {:key=>true}],
       [:short, :sequence, {:null=>false}, {:key=>true}],
       [:long, :patchsize, {:null=>false}],
       [:short, :attributes, {:null=>false}],
       [:object, :header],
       [:char, :streamref_]],
     "MsiEmbeddedUI"=>
      [[:char, :msiembeddedui, {:null=>false}, {:key=>true}],
       [:char, :filename, {:null=>false}],
       [:short, :attributes, {:null=>false}],
       [:long, :messagefilter],
       [:object, :data, {:null=>false}]],
     "MsiDigitalCertificate"=>
      [[:char, :digitalcertificate, {:null=>false}, {:key=>true}],
       [:object, :certdata, {:null=>false}]],
     "MsiAssemblyName"=>
      [[:char, :component_, {:null=>false}, {:key=>true}],
       [:char, :name, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}]],
     "MsiPatchOldAssemblyName"=>
      [[:char, :assembly, {:null=>false}, {:key=>true}],
       [:char, :name, {:null=>false}, {:key=>true}],
       [:char, :value, {:null=>false}]],
     "RemoveFile"=>
      [[:char, :filekey, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}],
       [:char, :filename, {:local=>true}],
       [:char, :dirproperty, {:null=>false}],
       [:short, :installmode, {:null=>false}]],
     "RemoveRegistry"=>
      [[:char, :removeregistry, {:null=>false}, {:key=>true}],
       [:short, :root, {:null=>false}],
       [:char, :key, {:null=>false}, {:local=>true}],
       [:char, :name, {:local=>true}],
       [:char, :component_, {:null=>false}]],
     "FeatureComponents"=>
      [[:char, :feature_, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}, {:key=>true}]],
     "CCPSearch"=>[[:char, :signature_, {:null=>false}, {:key=>true}]],
     "Error"=>
      [[:short, :error, {:null=>false}, {:key=>true}],
       [:char, :message, {:local=>true}]],
     "Extension"=>
      [[:char, :extension, {:null=>false}, {:key=>true}],
       [:char, :component_, {:null=>false}, {:key=>true}],
       [:char, :progid_],
       [:char, :mime_],
       [:char, :feature_, {:null=>false}]],
     "PatchPackage"=>
      [[:char, :patchid, {:null=>false}, {:key=>true}],
       [:short, :media_, {:null=>false}]]
    }
  end
end

if MSI::Constants.constants.empty?
  WIN32OLE.const_load('WindowsInstaller.Installer' , MSI::Constants)
  MSI::Constants.constants.each{|i|
    if i =~ /^Msi(.+)/
      MSI.const_set($1, MSI::Constants.const_get(i))
    end
  }
end