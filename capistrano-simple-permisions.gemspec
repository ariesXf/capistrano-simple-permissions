# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/simple_permissions/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-simple-permissions'
  spec.version       = Capistrano::SimplePermissions::VERSION
  spec.authors       = ['DaMoo']
  spec.email         = ['git@damoo.zone']

  spec.summary       = 'Capistrano task for ensuring specific permissions on files and folders on deploy.'
  spec.homepage      = 'https://github.com/da-moo/capistrano-simple-permissions'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.12'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '>= 12.3.3'
end
