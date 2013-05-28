$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acid_tenent"
  s.version     = Subscribem::VERSION
  s.authors     = ["Brian Dear"]
  s.email       = ["superacidjax@me.com"]
  s.homepage    = "https://github.com/superacidjax/multi-tenant"
  s.summary     = "A multi-tenant rails engine"
  s.description = "An engine to provide functionality for multi-tenant accounts and subscriptions"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.2.13'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'pry-rails'
  s.add_dependency 'apartment'
  s.add_dependency 'bcrypt-ruby'
  s.add_dependency 'decent_exposure'
  s.add_dependency "dynamic_form", "1.1.4"
  s.add_dependency 'haml-rails'
  s.add_dependency 'warden'

end
