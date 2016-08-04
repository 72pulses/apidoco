$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "apidoco/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "apidoco"
  s.version     = Apidoco::VERSION
  s.authors     = ["Al Ameen"]
  s.email       = ["k.ameen88@gmail.com"]
  s.homepage    = "https://github.com/apidoco"
  s.summary     = "Document Rest APIs"
  s.description = "Document Rest APIs."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency "angularjs-rails"
  s.add_dependency "bootstrap-sass", "~> 3.2.0"
  s.add_development_dependency "sqlite3"
end
