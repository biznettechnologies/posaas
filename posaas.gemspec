# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "posaas/version"

Gem::Specification.new do |s|
  s.name        = "posaas"
  s.version     = Posaas::VERSION
  s.authors     = ["Iulian Costan"]
  s.email       = ["iulian.costan@gmail.com"]
  s.homepage    = ""
  s.summary     = "posaas summary"
  s.description = "posaas description"

  s.rubyforge_project = "posaas"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activeresource"
end
