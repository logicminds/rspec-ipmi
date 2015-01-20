require 'rspec/expectations'
module RSpec::Ipmi
  module Matchers
    def method_missing(method, *args, &block)
      return RSpec::Ipmi::Matchers::Command.new(method, *args, &block) if method.to_s =~ /^run_command$/
      super
    end
  end
end

