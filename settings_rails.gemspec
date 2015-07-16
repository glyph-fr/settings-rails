$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'settings_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'settings-rails'
  s.version     = SettingsRails::VERSION
  s.authors     = ['Valentin Ballestrino']
  s.email       = ['vala@glyph.fr']
  s.homepage    = 'https://github.com/glyph-fr/settings-rails'
  s.summary     = 'Rails settings models with multiple data types, allowing db-driven global configuration. PostgreSQL Only.'
  s.description = 'Rails settings models with multiple data types, allowing db-driven global configuration. PostgreSQL Only.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'request_store'

  s.add_development_dependency 'sqlite3'
end
