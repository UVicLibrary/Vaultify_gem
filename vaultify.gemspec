$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "vaultify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vaultify"
  s.version     = Vaultify::VERSION
  s.authors     = "Braydon Justice"
  s.email       = "bjustice@uvic.ca"
  s.homepage    = "https://github.com/UVicLibrary/vaultify"
  s.summary     = "Standardizes metadata"
  s.description = "Data standardization application"
  s.license     = "Apache 2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "Gemfile", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"
  s.add_dependency "edtf"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "engine_cart"
end
