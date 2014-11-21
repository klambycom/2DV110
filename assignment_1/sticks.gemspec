# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name           = 'Sticks'
  spec.version        = '1.0'
  spec.authors        = ['Christian Nilsson']
  spec.email          = ['christian@klamby.com']
  spec.summary        = %q{A game called sticks}
  spec.description    = %q{A fun computer game with the name sticks}
  spec.homepage       = ''
  spec.license        = 'MIT'

  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'mocha'

  spec.files          = ['lib/sticks.rb']
  spec.executables    = ['bin/sticks']
  spec.test_files     = ['tests/test_sticks.rb']
  spec.require_paths  = ['lib']
end
