@schema = [
MSI::Schema.new('ActionText') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.char :description, :local => true
  t.char :template, :local => true
end,

MSI::Schema.new('AdminExecuteSequence') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.char :condition, :size => 255
  t.short :sequence
end,

MSI::Schema.new('AdminUISequence') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.char :condition, :size => 255
  t.short :sequence
end,

MSI::Schema.new('AdvtExecuteSequence') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.char :condition, :size => 255
  t.short :sequence
end,

MSI::Schema.new('AdvtUISequence') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.char :condition, :size => 255
  t.short :sequence
end,

MSI::Schema.new('AppId') do |t|
  t.char :appid, :size => 38, :null => false, :key => true
  t.char :remoteservername, :size => 255
  t.char :localservice, :size => 255
  t.char :serviceparameters, :size => 255
  t.char :dllsurrogate, :size => 255
  t.short :activateatstorage
  t.short :runasinteractiveuser
end,

MSI::Schema.new('AppSearch') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.char :signature_, :size => 72, :null => false, :key => true
end,

MSI::Schema.new('BBControl') do |t|
  t.char :billboard_, :size => 50, :null => false, :key => true
  t.char :bbcontrol, :size => 50, :null => false, :key => true
  t.char :type, :size => 50, :null => false
  t.short :x, :null => false
  t.short :y, :null => false
  t.short :width, :null => false
  t.short :height, :null => false
  t.long :attributes
  t.char :text, :size => 50, :local => true
end,

MSI::Schema.new('Billboard') do |t|
  t.char :billboard, :size => 50, :null => false, :key => true
  t.char :feature_, :size => 38, :null => false
  t.char :action, :size => 50
  t.short :ordering
end,

MSI::Schema.new('Binary') do |t|
  t.char :name, :size => 72, :null => false, :key => true
  t.object :data, :null => false
end,

MSI::Schema.new('BindImage') do |t|
  t.char :file_, :size => 72, :null => false, :key => true
  t.char :path, :size => 255
end,

MSI::Schema.new('CCPSearch') do |t|
  t.char :signature_, :size => 72, :null => false, :key => true
end,

MSI::Schema.new('CheckBox') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.char :value, :size => 64
end,

MSI::Schema.new('Class') do |t|
  t.char :clsid, :size => 38, :null => false, :key => true
  t.char :context, :size => 32, :null => false, :key => true
  t.char :component_, :size => 72, :null => false, :key => true
  t.char :progid_default, :size => 255
  t.char :description, :size => 255, :local => true
  t.char :appid_, :size => 38
  t.char :filetypemask, :size => 255
  t.char :icon_, :size => 72
  t.short :iconindex
  t.char :definprochandler, :size => 32
  t.char :argument, :size => 255
  t.char :feature_, :size => 38, :null => false
  t.short :attributes
end,

MSI::Schema.new('ComboBox') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.short :order, :null => false, :key => true
  t.char :value, :size => 64, :null => false
  t.char :text, :size => 64, :local => true
end,

MSI::Schema.new('CompLocator') do |t|
  t.char :signature_, :size => 72, :null => false, :key => true
  t.char :componentid, :size => 38, :null => false
  t.short :type
end,

MSI::Schema.new('Complus') do |t|
  t.char :component_, :size => 72, :null => false, :key => true
  t.short :exptype, :key => true
end,

MSI::Schema.new('Component') do |t|
  t.char :component, :size => 72, :null => false, :key => true
  t.char :componentid, :size => 38
  t.char :directory_, :size => 72, :null => false
  t.short :attributes, :null => false
  t.char :condition, :size => 255
  t.char :keypath, :size => 72
end,

MSI::Schema.new('Condition') do |t|
  t.char :feature_, :size => 38, :null => false, :key => true
  t.short :level, :null => false, :key => true
  t.char :condition, :size => 255
end,

MSI::Schema.new('Control') do |t|
  t.char :dialog_, :size => 72, :null => false, :key => true
  t.char :control, :size => 50, :null => false, :key => true
  t.char :type, :size => 20, :null => false
  t.short :x, :null => false
  t.short :y, :null => false
  t.short :width, :null => false
  t.short :height, :null => false
  t.long :attributes
  t.char :property, :size => 50
  t.char :text, :local => true
  t.char :control_next, :size => 50
  t.char :help, :size => 50, :local => true
end,

MSI::Schema.new('ControlCondition') do |t|
  t.char :dialog_, :size => 72, :null => false, :key => true
  t.char :control_, :size => 50, :null => false, :key => true
  t.char :action, :size => 50, :null => false, :key => true
  t.char :condition, :size => 255, :null => false, :key => true
end,

MSI::Schema.new('ControlEvent') do |t|
  t.char :dialog_, :size => 72, :null => false, :key => true
  t.char :control_, :size => 50, :null => false, :key => true
  t.char :event, :size => 50, :null => false, :key => true
  t.char :argument, :size => 255, :null => false, :key => true
  t.char :condition, :size => 255, :key => true
  t.short :ordering
end,

MSI::Schema.new('CreateFolder') do |t|
  t.char :directory_, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false, :key => true
end,

MSI::Schema.new('CustomAction') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.short :type, :null => false
  t.char :source, :size => 72
  t.char :target, :size => 255
end,

MSI::Schema.new('Dialog') do |t|
  t.char :dialog, :size => 72, :null => false, :key => true
  t.short :hcentering, :null => false
  t.short :vcentering, :null => false
  t.short :width, :null => false
  t.short :height, :null => false
  t.long :attributes
  t.char :title, :size => 128, :local => true
  t.char :control_first, :size => 50, :null => false
  t.char :control_default, :size => 50
  t.char :control_cancel, :size => 50
end,

MSI::Schema.new('Directory') do |t|
  t.char :directory, :size => 72, :null => false, :key => true
  t.char :directory_parent, :size => 72
  t.char :defaultdir, :size => 255, :null => false, :local => true
end,

MSI::Schema.new('DrLocator') do |t|
  t.char :signature_, :size => 72, :null => false, :key => true
  t.char :parent, :size => 72, :key => true
  t.char :path, :size => 255, :key => true
  t.short :depth
end,

MSI::Schema.new('DuplicateFile') do |t|
  t.char :filekey, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :file_, :size => 72, :null => false
  t.char :destname, :size => 255, :local => true
  t.char :destfolder, :size => 72
end,

MSI::Schema.new('Environment') do |t|
  t.char :environment, :size => 72, :null => false, :key => true
  t.char :name, :size => 255, :null => false, :local => true
  t.char :value, :size => 255, :local => true
  t.char :component_, :size => 72, :null => false
end,

MSI::Schema.new('Error') do |t|
  t.short :error, :null => false, :key => true
  t.char :message, :local => true
end,

MSI::Schema.new('EventMapping') do |t|
  t.char :dialog_, :size => 72, :null => false, :key => true
  t.char :control_, :size => 50, :null => false, :key => true
  t.char :event, :size => 50, :null => false, :key => true
  t.char :attribute, :size => 50, :null => false
end,

MSI::Schema.new('Extension') do |t|
  t.char :extension, :size => 255, :null => false, :key => true
  t.char :component_, :size => 72, :null => false, :key => true
  t.char :progid_, :size => 255
  t.char :mime_, :size => 64
  t.char :feature_, :size => 38, :null => false
end,

MSI::Schema.new('Feature') do |t|
  t.char :feature, :size => 38, :null => false, :key => true
  t.char :feature_parent, :size => 38
  t.char :title, :size => 64, :local => true
  t.char :description, :size => 255, :local => true
  t.short :display
  t.short :level, :null => false
  t.char :directory_, :size => 72
  t.short :attributes, :null => false
end,

MSI::Schema.new('FeatureComponents') do |t|
  t.char :feature_, :size => 38, :null => false, :key => true
  t.char :component_, :size => 72, :null => false, :key => true
end,

MSI::Schema.new('File') do |t|
  t.char :file, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :filename, :size => 255, :null => false, :local => true
  t.long :filesize, :null => false
  t.char :version, :size => 72
  t.char :language, :size => 20
  t.short :attributes
  t.short :sequence, :null => false
end,

MSI::Schema.new('FileSFPCatalog') do |t|
  t.char :file_, :size => 72, :null => false, :key => true
  t.char :sfpcatalog_, :size => 255, :null => false, :key => true
end,

MSI::Schema.new('Font') do |t|
  t.char :file_, :size => 72, :null => false, :key => true
  t.char :fonttitle, :size => 128
end,

MSI::Schema.new('Icon') do |t|
  t.char :name, :size => 72, :null => false, :key => true
  t.object :data, :null => false
end,

MSI::Schema.new('IniFile') do |t|
  t.char :inifile, :size => 72, :null => false, :key => true
  t.char :filename, :size => 255, :null => false, :local => true
  t.char :dirproperty, :size => 72
  t.char :section, :size => 96, :null => false, :local => true
  t.char :key, :size => 128, :null => false, :local => true
  t.char :value, :size => 255, :null => false, :local => true
  t.short :action, :null => false
  t.char :component_, :size => 72, :null => false
end,

MSI::Schema.new('IniLocator') do |t|
  t.char :signature_, :size => 72, :null => false, :key => true
  t.char :filename, :size => 255, :null => false
  t.char :section, :size => 96, :null => false
  t.char :key, :size => 128, :null => false
  t.short :field
  t.short :type
end,

MSI::Schema.new('InstallExecuteSequence') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.char :condition, :size => 255
  t.short :sequence
end,

MSI::Schema.new('InstallUISequence') do |t|
  t.char :action, :size => 72, :null => false, :key => true
  t.char :condition, :size => 255
  t.short :sequence
end,

MSI::Schema.new('IsolatedComponent') do |t|
  t.char :component_shared, :size => 72, :null => false, :key => true
  t.char :component_application, :size => 72, :null => false, :key => true
end,

MSI::Schema.new('LaunchCondition') do |t|
  t.char :condition, :size => 255, :null => false, :key => true
  t.char :description, :size => 255, :null => false, :local => true
end,

MSI::Schema.new('ListBox') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.short :order, :null => false, :key => true
  t.char :value, :size => 64, :null => false
  t.char :text, :size => 64, :local => true
end,

MSI::Schema.new('ListView') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.short :order, :null => false, :key => true
  t.char :value, :size => 64, :null => false
  t.char :text, :size => 64, :local => true
  t.char :binary_, :size => 72
end,

MSI::Schema.new('LockPermissions') do |t|
  t.char :lockobject, :size => 72, :null => false, :key => true
  t.char :table, :size => 32, :null => false, :key => true
  t.char :domain, :size => 255, :key => true
  t.char :user, :size => 255, :null => false, :key => true
  t.long :permission
end,

MSI::Schema.new('MIME') do |t|
  t.char :contenttype, :size => 64, :null => false, :key => true
  t.char :extension_, :size => 255, :null => false
  t.char :clsid, :size => 38
end,

MSI::Schema.new('Media') do |t|
  t.short :diskid, :null => false, :key => true
  t.short :lastsequence, :null => false
  t.char :diskprompt, :size => 64, :local => true
  t.char :cabinet, :size => 255
  t.char :volumelabel, :size => 32
  t.char :source, :size => 72
end,

MSI::Schema.new('MoveFile') do |t|
  t.char :filekey, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :sourcename, :size => 255, :local => true
  t.char :destname, :size => 255, :local => true
  t.char :sourcefolder, :size => 72
  t.char :destfolder, :size => 72, :null => false
  t.short :options, :null => false
end,

MSI::Schema.new('MsiAssembly') do |t|
  t.char :component_, :size => 72, :null => false, :key => true
  t.char :feature_, :size => 38, :null => false
  t.char :file_manifest, :size => 72
  t.char :file_application, :size => 72
  t.short :attributes
end,

MSI::Schema.new('MsiAssemblyName') do |t|
  t.char :component_, :size => 72, :null => false, :key => true
  t.char :name, :size => 255, :null => false, :key => true
  t.char :value, :size => 255, :null => false
end,

MSI::Schema.new('MsiDigitalCertificate') do |t|
  t.char :digitalcertificate, :size => 72, :null => false, :key => true
  t.object :certdata, :null => false
end,

MSI::Schema.new('MsiDigitalSignature') do |t|
  t.char :table, :size => 32, :null => false, :key => true
  t.char :signobject, :size => 72, :null => false, :key => true
  t.char :digitalcertificate_, :size => 72, :null => false
  t.object :hash
end,

MSI::Schema.new('MsiFileHash') do |t|
  t.char :file_, :size => 72, :null => false, :key => true
  t.short :options, :null => false
  t.long :hashpart1, :null => false
  t.long :hashpart2, :null => false
  t.long :hashpart3, :null => false
  t.long :hashpart4, :null => false
end,

MSI::Schema.new('MsiPatchHeaders') do |t|
  t.char :streamref, :size => 38, :null => false, :key => true
  t.object :header, :null => false
end,

MSI::Schema.new('ODBCAttribute') do |t|
  t.char :driver_, :size => 72, :null => false, :key => true
  t.char :attribute, :size => 40, :null => false, :key => true
  t.char :value, :size => 255, :local => true
end,

MSI::Schema.new('ODBCDataSource') do |t|
  t.char :datasource, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :description, :size => 255, :null => false
  t.char :driverdescription, :size => 255, :null => false
  t.short :registration, :null => false
end,

MSI::Schema.new('ODBCDriver') do |t|
  t.char :driver, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :description, :size => 255, :null => false
  t.char :file_, :size => 72, :null => false
  t.char :file_setup, :size => 72
end,

MSI::Schema.new('ODBCSourceAttribute') do |t|
  t.char :datasource_, :size => 72, :null => false, :key => true
  t.char :attribute, :size => 32, :null => false, :key => true
  t.char :value, :size => 255, :local => true
end,

MSI::Schema.new('ODBCTranslator') do |t|
  t.char :translator, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :description, :size => 255, :null => false
  t.char :file_, :size => 72, :null => false
  t.char :file_setup, :size => 72
end,

MSI::Schema.new('Patch') do |t|
  t.char :file_, :size => 72, :null => false, :key => true
  t.short :sequence, :null => false, :key => true
  t.long :patchsize, :null => false
  t.short :attributes, :null => false
  t.object :header
  t.char :streamref_, :size => 38
end,

MSI::Schema.new('PatchPackage') do |t|
  t.char :patchid, :size => 38, :null => false, :key => true
  t.short :media_, :null => false
end,

MSI::Schema.new('ProgId') do |t|
  t.char :progid, :size => 255, :null => false, :key => true
  t.char :progid_parent, :size => 255
  t.char :class_, :size => 38
  t.char :description, :size => 255, :local => true
  t.char :icon_, :size => 72
  t.short :iconindex
end,

MSI::Schema.new('Property') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.char :value, :null => false, :local => true
end,

MSI::Schema.new('PublishComponent') do |t|
  t.char :componentid, :size => 38, :null => false, :key => true
  t.char :qualifier, :size => 255, :null => false, :key => true
  t.char :component_, :size => 72, :null => false, :key => true
  t.char :appdata, :size => 255, :local => true
  t.char :feature_, :size => 38, :null => false
end,

MSI::Schema.new('RadioButton') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.short :order, :null => false, :key => true
  t.char :value, :size => 64, :null => false
  t.short :x, :null => false
  t.short :y, :null => false
  t.short :width, :null => false
  t.short :height, :null => false
  t.char :text, :size => 64, :local => true
  t.char :help, :size => 50, :local => true
end,

MSI::Schema.new('RegLocator') do |t|
  t.char :signature_, :size => 72, :null => false, :key => true
  t.short :root, :null => false
  t.char :key, :size => 255, :null => false
  t.char :name, :size => 255
  t.short :type
end,

MSI::Schema.new('Registry') do |t|
  t.char :registry, :size => 72, :null => false, :key => true
  t.short :root, :null => false
  t.char :key, :size => 255, :null => false, :local => true
  t.char :name, :size => 255, :local => true
  t.char :value, :local => true
  t.char :component_, :size => 72, :null => false
end,

MSI::Schema.new('RemoveFile') do |t|
  t.char :filekey, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :filename, :size => 255, :local => true
  t.char :dirproperty, :size => 72, :null => false
  t.short :installmode, :null => false
end,

MSI::Schema.new('RemoveIniFile') do |t|
  t.char :removeinifile, :size => 72, :null => false, :key => true
  t.char :filename, :size => 255, :null => false, :local => true
  t.char :dirproperty, :size => 72
  t.char :section, :size => 96, :null => false, :local => true
  t.char :key, :size => 128, :null => false, :local => true
  t.char :value, :size => 255, :local => true
  t.short :action, :null => false
  t.char :component_, :size => 72, :null => false
end,

MSI::Schema.new('RemoveRegistry') do |t|
  t.char :removeregistry, :size => 72, :null => false, :key => true
  t.short :root, :null => false
  t.char :key, :size => 255, :null => false, :local => true
  t.char :name, :size => 255, :local => true
  t.char :component_, :size => 72, :null => false
end,

MSI::Schema.new('ReserveCost') do |t|
  t.char :reservekey, :size => 72, :null => false, :key => true
  t.char :component_, :size => 72, :null => false
  t.char :reservefolder, :size => 72
  t.long :reservelocal, :null => false
  t.long :reservesource, :null => false
end,

MSI::Schema.new('SFPCatalog') do |t|
  t.char :sfpcatalog, :size => 255, :null => false, :key => true
  t.object :catalog, :null => false
  t.char :dependency
end,

MSI::Schema.new('SelfReg') do |t|
  t.char :file_, :size => 72, :null => false, :key => true
  t.short :cost
end,

MSI::Schema.new('ServiceControl') do |t|
  t.char :servicecontrol, :size => 72, :null => false, :key => true
  t.char :name, :size => 255, :null => false, :local => true
  t.short :event, :null => false
  t.char :arguments, :size => 255, :local => true
  t.short :wait
  t.char :component_, :size => 72, :null => false
end,

MSI::Schema.new('ServiceInstall') do |t|
  t.char :serviceinstall, :size => 72, :null => false, :key => true
  t.char :name, :size => 255, :null => false
  t.char :displayname, :size => 255, :local => true
  t.long :servicetype, :null => false
  t.long :starttype, :null => false
  t.long :errorcontrol, :null => false
  t.char :loadordergroup, :size => 255
  t.char :dependencies, :size => 255
  t.char :startname, :size => 255
  t.char :password, :size => 255
  t.char :arguments, :size => 255
  t.char :component_, :size => 72, :null => false
  t.char :description, :size => 255, :local => true
end,

MSI::Schema.new('Shortcut') do |t|
  t.char :shortcut, :size => 72, :null => false, :key => true
  t.char :directory_, :size => 72, :null => false
  t.char :name, :size => 128, :null => false, :local => true
  t.char :component_, :size => 72, :null => false
  t.char :target, :size => 72, :null => false
  t.char :arguments, :size => 255
  t.char :description, :size => 255, :local => true
  t.short :hotkey
  t.char :icon_, :size => 72
  t.short :iconindex
  t.short :showcmd
  t.char :wkdir, :size => 72
end,

MSI::Schema.new('Signature') do |t|
  t.char :signature, :size => 72, :null => false, :key => true
  t.char :filename, :size => 255, :null => false
  t.char :minversion, :size => 20
  t.char :maxversion, :size => 20
  t.long :minsize
  t.long :maxsize
  t.long :mindate
  t.long :maxdate
  t.char :languages, :size => 255
end,

MSI::Schema.new('TextStyle') do |t|
  t.char :textstyle, :size => 72, :null => false, :key => true
  t.char :facename, :size => 32, :null => false
  t.short :size, :null => false
  t.long :color
  t.short :stylebits
end,

MSI::Schema.new('TypeLib') do |t|
  t.char :libid, :size => 38, :null => false, :key => true
  t.short :language, :null => false, :key => true
  t.char :component_, :size => 72, :null => false, :key => true
  t.long :version
  t.char :description, :size => 128, :local => true
  t.char :directory_, :size => 72
  t.char :feature_, :size => 38, :null => false
  t.long :cost
end,

MSI::Schema.new('UIText') do |t|
  t.char :key, :size => 72, :null => false, :key => true
  t.char :text, :size => 255, :local => true
end,

MSI::Schema.new('Upgrade') do |t|
  t.char :upgradecode, :size => 38, :null => false, :key => true
  t.char :versionmin, :size => 20, :key => true
  t.char :versionmax, :size => 20, :key => true
  t.char :language, :size => 255, :key => true
  t.long :attributes, :null => false, :key => true
  t.char :remove, :size => 255
  t.char :actionproperty, :size => 72, :null => false
end,

MSI::Schema.new('Verb') do |t|
  t.char :extension_, :size => 255, :null => false, :key => true
  t.char :verb, :size => 32, :null => false, :key => true
  t.short :sequence
  t.char :command, :size => 255, :local => true
  t.char :argument, :size => 255, :local => true
end,

MSI::Schema.new('_Validation') do |t|
  t.char :table, :size => 32, :null => false, :key => true
  t.char :column, :size => 32, :null => false, :key => true
  t.char :nullable, :size => 4, :null => false
  t.long :minvalue
  t.long :maxvalue
  t.char :keytable, :size => 255
  t.short :keycolumn
  t.char :category, :size => 32
  t.char :set, :size => 255
  t.char :description, :size => 255
end
]
