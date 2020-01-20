$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nite_pool_select/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nite_pool_select"
  s.version     = "0.0.3"
  s.authors     = ["Nadav Blum"]
  s.email       = ["nadav@nite.org.il"]
  s.homepage    = ""
  s.summary     = "Selction of elements grouped in pools"
  s.description = "Support pool definitions for chapters, units and items. Provide selection method"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0"
 # s.add_dependency "rails", "~> 4.1"

  s.add_development_dependency "sqlite3", "~> 1.3.0"
end
