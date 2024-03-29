# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lumberjack_bunny_device/version"

Gem::Specification.new do |s|
  s.name        = "lumberjack_bunny_device"
  s.version     = LumberjackBunnyDevice::VERSION
  s.authors     = ["Grant Rodgers"]
  s.email       = ["grantr@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "lumberjack_bunny_device"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "lumberjack", ["~> 1.0"]
  s.add_runtime_dependency "bunny", ["~> 0.7.5"]
end
