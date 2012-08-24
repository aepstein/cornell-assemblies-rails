$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cornell-assemblies-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cornell-assemblies-rails"
  s.version     = CornellAssembliesRails::VERSION
  s.authors     = ["Ari Epstein"]
  s.email       = ["ate2@cornell.edu"]
  s.homepage    = "https://assembly.cornell.edu/trac/cornell-assemblies-rails"
  s.summary     = "Provides asset pipeline elements to implement Cornell Office of the Assemblies look and feel."
  s.description = "This package is used to provide uniform look and feel across applications developed for the Office of the Assemblies."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1"
  s.add_dependency "jquery-rails", "~> 2.0"
  s.add_dependency "bcrypt-ruby", "~> 3.0"
  s.add_dependency "rails3-jquery-autocomplete", "~> 1.0"
  s.add_dependency "formtastic", "~> 2.1"
  s.add_dependency "cocoon", "~> 1.0"
  s.add_dependency "best_in_place", "~> 1.1"

  s.add_development_dependency "sqlite3"
end

