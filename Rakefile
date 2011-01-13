require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('simple_phone_number', '0.1.8') do |p|
  p.description        = "Validate and set phone number format"
  p.url                = "http://github.com/akennedy/simple_phone_number"
  p.author             = 'Andrew Kennedy'
  p.email              = 'andrew@jackrussellsoftware.com'
  p.ignore_pattern     = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }