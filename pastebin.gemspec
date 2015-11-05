# coding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pastebin/version'

Gem::Specification.new do |spec|
	spec.name          = 'pastebin'
	spec.version       = Pastebin::VERSION
	spec.author        = 'Christian Mayer'
	spec.email         = 'christian@fox21.at'
	
	spec.summary       = %q{Just another Pastebin.com CLI script, but you can even login with your user account.}
	spec.homepage      = 'https://github.com/TheFox/pastebin'
	spec.license       = 'GPL-3.0'
	
	spec.files         = `git ls-files -z`.split("\x0").reject{ |f| f.match(%r{^(test|spec|features)/}) }
	spec.bindir        = 'bin'
	spec.executables   = ['pastebin']
	spec.require_paths = ['lib']
	spec.required_ruby_version = '>=2.2.0'
	
	spec.add_development_dependency 'bundler', '1.10.2'
	
	spec.add_dependency 'dotenv', '2.0.2'
	spec.add_dependency 'highline', '1.7.8'
end
