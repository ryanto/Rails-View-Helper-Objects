# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails-view-helper-objects/version"

Gem::Specification.new do |s|
  s.name        = "rails-view-helper-objects"
  s.version     = Rails::View::Helper::Objects::VERSION
  s.authors     = ["Ryan"]
  s.email       = ["ryanto"]
  s.homepage    = ""
  s.summary     = %q{Use objects in your views}
  s.description = %q{Rails view helpers expressed as objects}

  s.rubyforge_project = "rails-view-helper-objects"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_dependency "rails", '>=3.0.0'
end
