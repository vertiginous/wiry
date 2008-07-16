# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/wiry.rb'

Hoe.new('wiry', Wiry::VERSION) do |p|
  # p.rubyforge_name = 'wiryx' # if different than lowercase project name
  p.developer('Gordon Thiesfeld', 'gordon@robustlunchbox.com')
end

desc 'run the spec suite'
task :spec do
  specs = FileList['spec/**/*.rb']
  sh "spec -O spec/spec.opts #{specs}"
end

namespace :fixture do
	
  directory 'spec/msi'
  
  desc 'copy msi files to be used as "fixtures"'
  task :setup => ['spec/msi', :clean] do 
    msi_files = FileList['C:/Program Files/Windows Installer 4.5 SDK/DATABASE/*.msi']
    cp msi_files, 'spec/msi'
  end
  
  desc 'clean up the fixtures'
  task :clean do
    rm FileList['spec/msi/*.msi']
  end
  
end

# vim: syntax=Ruby
