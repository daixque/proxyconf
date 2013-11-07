require "proxyconf/version"
require "proxyconf/cli"

module ProxyConf
end

if true
  require "proxyconf/mac"
  ProxyConf::Cli.engine = ProxyConf::Mac.new
end