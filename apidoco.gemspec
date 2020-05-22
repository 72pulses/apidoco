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

  s.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_runtime_dependency 'angularjs-rails', '~> 1.6', '>= 1.6.8'
  s.add_runtime_dependency 'rails', '>= 4.0.0'

  s.add_development_dependency 'apparition', '~> 0.1', '>= 0.1.0'
  s.add_development_dependency 'capybara', '~> 3.31', '>= 3.31.0'
  s.add_development_dependency 'generator_spec', '~> 0.9', '>= 0.9.4'
  s.add_development_dependency 'puma', '~> 4.3', '>= 4.3.3'
  s.add_development_dependency 'rspec-rails', '~> 3.8', '>= 3.8.1'
  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.13'
end
