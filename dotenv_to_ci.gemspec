lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |s|
  s.name        = 'dotenv_to_ci'
  s.version     = DotenvToCI::VERSION
  s.date        = '2019-05-22'
  s.summary     = "dotenv to CI env"
  s.description = "Set dotenv values in your CI provider"
  s.authors     = ["Josh Holtz"]
  s.email       = 'me@joshholtz.com'
  s.files       = Dir.glob("*/lib/**/*", File::FNM_DOTMATCH) + Dir["bin/*"]
  s.bindir      = "bin"
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.homepage    = 'https://github.com/joshdholtz/dotenv_to_ci'
  s.license     = 'MIT'

  s.add_dependency('commander', '>= 4.0')
  s.add_dependency('dotenv', '>= 2.1.1', '< 3.0.0')
  s.add_dependency('rest-client', '>= 1.8.0')
end
