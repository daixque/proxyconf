require 'thor'
require 'proxyconf/mac'

module ProxyConf
  class Cli < Thor
    class << self
      attr_accessor :engine
    end

    desc 'export', 'print export proxy command for current network'
    def export
      engine.export
    end

    desc 'active_network', 'show active network service name'
    def active_network
      puts engine.active_network
    end

    private
    def engine
      self.class.engine
    end
  end
end