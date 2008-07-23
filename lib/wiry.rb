class Wiry
  VERSION = '0.0.1'
end

$LOAD_PATH.unshift File.dirname(__FILE__)

require 'wiry/msi'
require 'wiry/msi/constants'
require 'wiry/msi/database'
require 'wiry/msi/table'
require 'wiry/msi/view'
require 'wiry/msi/record'
require 'wiry/msi/schema'
require 'wiry/msi/sequence'
require 'wiry/msi/summary'