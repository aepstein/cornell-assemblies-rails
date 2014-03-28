$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cornell_assemblies_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cornell_assemblies_rails"
  s.version     = CornellAssembliesRails::VERSION
  s.authors     = ["Ari Epstein"]
  s.email       = ["ate2@cornell.edu"]
  s.homepage    = "https://assembly.cornell.edu/trac/cornell-assemblies-rails"
  s.summary     = "Provides asset pipeline elements to implement Cornell Office of the Assemblies look and feel."
  s.description = "This package is used to provide uniform look and feel across applications developed for the Office of the Assemblies."

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "jquery-rails", "~> 3.1"
  s.add_dependency "jquery-ui-rails", "~> 4.0"
  s.add_dependency "bcrypt-ruby", "~> 3.0"
  s.add_dependency "cocoon", "~> 1.0"
  s.add_dependency "squeel", "~> 1.0"
  s.add_dependency "cornell_ldap", "~> 1.4.3"
  s.add_dependency "bluecloth", "~> 2.0"
#  s.add_dependency "best_in_place", "~> 2.1"
  s.add_dependency "simple_form", "~> 3.0"
  s.add_dependency "bootstrap-sass", "~> 3.1"
  s.add_dependency "tabulous", "~> 2.0"
  s.add_dependency "kaminari", "~> 0.14"
  s.add_dependency "kaminari-bootstrap", "~> 3.0"
  s.add_dependency "cornell_netid", "~> 1.1"
  s.add_dependency "decent_exposure", "~> 2.3"
  s.add_dependency "fullcalendar-rails", "~> 1.5"
  s.add_dependency "bootstrap-datetimepicker-rails", "~> 0.0.11"

  s.add_development_dependency "sqlite3"
end

