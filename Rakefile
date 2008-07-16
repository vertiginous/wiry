# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/wiry.rb'

Hoe.new('wiry', Wiry::VERSION) do |p|
  # p.rubyforge_name = 'wiryx' # if different than lowercase project name
  p.developer('Gordon Thiesfeld', 'gordon@robustlunchbox.com')
end

task :spec do
  specs = FileList['spec/**/*.rb']
  sh "spec -O spec/spec.opts #{specs}"
end

namespace :fixture do
	
  directory 'spec/msi'
  
  task :setup => 'spec/msi' do 
    msi_files = FileList['C:/Program Files/Windows Installer 4.5 SDK/DATABASE/*.msi']
    cp msi_files, 'spec/msi'
  end
  
  task :clean do
    rm FileList['spec/msi/*.msi']
  end
  
end

# vim: syntax=Ruby
