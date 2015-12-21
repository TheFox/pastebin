# coding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'pastebin/version'

Gem::Specification.new do |spec|
	spec.name          = 'thefox-pastebin'
	spec.version       = TheFox::Pastebin::VERSION
	spec.date          = TheFox::Pastebin::DATE
	spec.author        = 'Christian Mayer'
	spec.email         = 'christian@fox21.at'
	
	spec.summary       = %q{Pastebin.com CLI}
	spec.description   = %q{Just another Pastebin.com CLI script, but you can even login with your user account.}
	spec.homepage      = TheFox::Pastebin::HOMEPAGE
	spec.license       = 'GPL-3.0'
	
	spec.files         = `git ls-files -z`.split("\x0").reject{ |f| f.match(%r{^(test|spec|features)/}) }
	spec.bindir        = 'bin'
	spec.executables   = ['pastebin']
	spec.require_paths = ['lib']
	spec.required_ruby_version = '>=2.0.0'
	
	spec.add_dependency 'dotenv', '~>2.0'
	spec.add_dependency 'highline', '~>1.7'
end
