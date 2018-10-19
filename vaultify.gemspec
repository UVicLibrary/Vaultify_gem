$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vaultify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vaultify"
  s.version     = Vaultify::VERSION
  s.authors     = ["llvallejo93"]
  s.email       = ["llvallejo93@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Vaultify."
  s.description = "TODO: Description of Vaultify."
  s.license     = "Apache 2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "sqlite3"
end
