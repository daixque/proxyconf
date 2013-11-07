# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proxyconf/version'

Gem::Specification.new do |spec|
  spec.name          = "proxyconf"
  spec.version       = ProxyConf::VERSION
  spec.authors       = ["daixque"]
  spec.email         = ["daixque@gmail.com"]
  spec.description   = %q{proxyconf configurates proxy setting of terminal.}
  spec.summary       = %q{proxy switcher for terminal}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "thor"
end
