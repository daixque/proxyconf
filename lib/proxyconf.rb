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

case RbConfig::CONFIG['host_os']
when /darwin/
  # MacOSX
  require "proxyconf/mac"
  ProxyConf::Cli.engine = ProxyConf::Mac.new
else
  puts 'your operating system is not supported, sorry.'
  exit 1
end