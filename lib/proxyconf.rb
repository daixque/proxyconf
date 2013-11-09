require "proxyconf/version"
require "proxyconf/engine"
require "proxyconf/cli"

module ProxyConf
  HOME        = "#{File.expand_path('~')}/.proxyconf"
  PROXIES_DIR = "proxies"
end

if true
  require "proxyconf/mac"
  ProxyConf::Cli.engine = ProxyConf::Mac.new
end