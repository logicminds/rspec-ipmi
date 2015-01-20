require 'rubyipmi'

module RSpec::Ipmi
  class IpmiHost

    attr_reader :hostname, :username, :password, :provider
    attr_accessor :connection

    def initialize(opts={})
      @hostname = opts[:hostname]
      @username = opts[:username] || RSpec.configuration.username
      @password = opts[:password] || RSpec.configuration.password
      @provider = opts[:provider] || RSpec.configuration.ipmi_provider
    end

    def connection
      @connection ||= Rubyipmi.connect(username, password, hostname, provider)
    end

    def run_command(command=[], args=nil)
      command = "#{command}(#{args.join(',')})" unless args.nil?
      value = connection.instance_eval(command)
    end
  end
end
