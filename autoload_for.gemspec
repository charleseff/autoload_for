# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "autoload_for"

Gem::Specification.new do |s|
  s.name        = "autoload_for"
  s.version     = AutoloadFor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Charles Finkel"]
  s.email       = ["charles.finkel@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Have your classes in a directory autoloaded, just like Rails does with app/models, app/controllers, etc.}
  s.description = %q{Have your classes in a directory autoloaded, just like Rails does with app/models, app/controllers, etc.}

  s.rubyforge_project = "autoload_for"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activesupport'
  s.add_development_dependency 'rspec', '>= 2.6.0'

end
