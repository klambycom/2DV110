# coding: utf-8

lib = File.expand_path('../lib/', __FILE__)
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

  spec.add_dependency 'colorize'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'mocha'

  spec.files          = Dir.glob('lib/*.rb')
  spec.executables    = ['sticks']
  spec.test_files     = Dir.glob('test/*.rb')
  spec.require_paths  = 'lib'
end
