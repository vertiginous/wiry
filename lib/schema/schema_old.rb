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

MSI::Schema.new('CheckBox') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.char :value, :size => 64
end,

MSI::Schema.new('ComboBox') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.short :order, :null => false, :key => true
  t.char :value, :size => 64, :null => false
  t.char :text, :size => 64, :local => true
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

MSI::Schema.new('Property') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.char :value, :null => false, :local => true
end,

MSI::Schema.new('RadioButton') do |t|
  t.char :property, :size => 72, :null => false, :key => true
  t.short :order, :null => false, :key => true
  t.char :value, :size => 64, :null => false
  t.short :x, :null => false
  t.short :y, :null => false
  t.short :width, :null => false
  t.short :height, :null => false
  t.char :text, :local => true
  t.char :help, :size => 50, :local => true
end,

MSI::Schema.new('TextStyle') do |t|
  t.char :textstyle, :size => 72, :null => false, :key => true
  t.char :facename, :size => 32, :null => false
  t.short :size, :null => false
  t.long :color
  t.short :stylebits
end,

MSI::Schema.new('UIText') do |t|
  t.char :key, :size => 72, :null => false, :key => true
  t.char :text, :size => 255, :local => true
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
