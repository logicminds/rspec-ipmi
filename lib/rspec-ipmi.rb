require 'rubyipmi'
require 'rspec'
require 'rspec-ipmi/matchers'
require 'rspec-ipmi/example'

RSpec.configure do |c|
  c.add_setting :username
  c.add_setting :password
  c.add_setting :ipmi_provider, :default => 'any'
  c.add_setting :ipmi_driver, :default => nil
end
