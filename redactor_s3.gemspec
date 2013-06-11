$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "redactor_s3/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "redactor_s3"
  s.version     = RedactorS3::VERSION
  s.authors     = ["Aske Hansen"]
  s.email       = ["aske@deeco.dk"]
  s.homepage    = "https://github.com/askehansen/redactor_s3"
  s.summary     = "Integrate redactor.js and amazon s3"
  s.description = "This gem makes it easy to integrate redactor.js with amazon s3"


  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "aws-sdk"
  s.add_dependency "jbuilder"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
