require 'rspec-ipmi/ipmi_host'

module RSpec::Ipmi
  module Matchers
    class Command
      #extend RSpec::Matchers::DSL
      attr_reader :command, :expected, :actual

      def initialize(*args, &block)
        @command = args[1]
        @title = "#{args[0]}(#{command})"
        @args = args.slice(2..-1)
        @block = block
      end

      def matches?(host)
        # convert the host if its just a hostname
        host = RSpec::Ipmi::IpmiHost.new({:hostname => host}) if host.instance_of?(String)
        unless host.instance_of?(RSpec::Ipmi::IpmiHost)
          raise 'Expect Object is not a hostname string or IpmiHost object'
        end

        value = host.run_command(command, @args)

      end

      def failure_message
         "expected command: #{command} to run successfully"
      end

      def failure_message_when_negated
        "expected command: #{command} to not run successfully"
      end

      # def description
      #
      # end
      #
      # def diffable?
      #
      # end
      #
      # def expected
      #
      # end
      #
      # def actual
      #
      # end



    end
  end
end


# matcher :run_
# end
# RSpec::Matchers.define :run_ipmi_command_successfully do |expected|
#   match do |actual|
#     actual % expected == 0
#   end
#   RSpec::Matchers.define :be_in_zipcode do |zipcode|
#     match do |friend|
#       friend.in_zipcode?(zipcode)
#     end
#
#     # Optional failure messages
#     failure_message_for_should do |actual|
#       "expected friend to be in zipcode"
#     end
#
#     failure_message_for_should_not do |actual|
#       "expected friend not to be in zipcode"
#     end
#
#     # Optional method description
#     description do
#       "checks user's current zipcode"
#     end
#   end