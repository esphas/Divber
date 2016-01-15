
require File.expand_path '../lib/divber/version', __FILE__

Gem::Specification.new do |divber|
  divber.name          = 'divber'
  divber.version       = Divber::VERSION
  divber.license       = 'MIT'

  divber.summary       = "A lightweight static site generator"
  divber.description   = "Divber is a lightweight static site generator in Ruby."

  divber.authors       = ["Esphas Kueen"]
  divber.email         = 'esphas@hotmail.com'
  divber.homepage      = 'https://github.com/esphas/divber'

  divber.require_paths = ['lib']
  divber.files         = Dir['**/*'].grep(/^(bin|lib)\//).reject{|d| FileTest.directory? d}
  divber.executables   = divber.files.grep(/^bin\//){|n| File.basename n}

  divber.add_runtime_dependency 'rayormoche', '>= 0'

  divber.add_development_dependency 'bundler', '~> 1'
  divber.add_development_dependency 'rake', '>= 0'

  divber.required_ruby_version = '>= 1.9.3'
end
