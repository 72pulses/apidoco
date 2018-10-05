$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'apidoco/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'apidoco'
  s.version     = Apidoco::VERSION
  s.authors     = ['Al Ameen', 'Sufinsha Musthafa', 'Nidhin S G', 'Aby George']
  s.email       = ['alameenkhader@gmail.com', 'nidhinsg@gmail.com']
  s.homepage    = 'https://github.com/72pulses/apidoco'
  s.summary     = 'Document Rest APIs'
  s.description = 'Document Rest APIs.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.0.0'
  s.add_dependency 'angularjs-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'generator_spec'
  s.add_development_dependency 'capybara-webkit'
end
