require 'rspec-ipmi/example/command_example_group'

RSpec::configure do |c|
  c.include RSpec::Ipmi::CommandExampleGroup
end