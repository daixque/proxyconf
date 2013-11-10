require "proxyconf/version"
require "proxyconf/engine"
require "proxyconf/cli"

module ProxyConf
  HOME        = "#{File.expand_path('~')}/.proxyconf"
  PROXIES_DIR = "proxies"
end

proxies_dir_path = File.join(ProxyConf::HOME, ProxyConf::PROXIES_DIR)
unless File.exist? proxies_dir_path
  puts "proxyconf home not found. do 'proxyconf-setup' first."
  exit 1
end

if true
  require "proxyconf/mac"
  ProxyConf::Cli.engine = ProxyConf::Mac.new
end