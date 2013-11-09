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

    desc 'add name proxy', 'add proxy setting into ~/.proxyconf/proxies'
    def add(name, proxy)
      engine.add(name, proxy)
    end

    desc 'remove name', 'remove proxy specified by name'
    def remove(name)
      engine.remove(name)
    end

    desc 'info', 'show proxy setting for specifed name'
    def info(name)
      engine.info(name)
    end

    desc 'list', 'list all proxy settings'
    def list
      engine.list
    end

    desc 'version', 'show version'
    def version
      puts ProxyConf::VERSION
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