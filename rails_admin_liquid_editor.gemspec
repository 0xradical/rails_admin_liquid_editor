$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_liquid_editor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_liquid_editor"
  s.version     = RailsAdminLiquidEditor::VERSION
  s.authors     = ["Thiago Brandão Damasceno"]
  s.email       = ["thiagobrandam@gmail.com"]
  s.homepage    = "http://github.com/thiagobrandam/rails_admin_liquid_editor"
  s.summary     = "Editor for Liquid fields in RailsAdmin"
  s.description = "Adds the power of CodeMirror editing to Liquid / Liquid+HTML fields in RailsAdmin"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "rails_admin", "~> 0.4.0", "< 0.5"
  s.add_dependency "codemirror-rails"
  s.add_dependency "liquid"
end
