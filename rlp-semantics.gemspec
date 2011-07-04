# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rlp/semantics/version"

Gem::Specification.new do |s|
  s.name        = "rlp-semantics"
  s.version     = Rlp::Semantics::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Aleksander Pohl"]
  s.email       = ["apohllo@o2.pl"]
  s.homepage    = ""
  s.summary     = %q{Rlp semantics provides the semantics layer for Ruby language processing of Polish}
  s.description = %q{Rlp semantics provides the semantics layer for Ruby language processing of Polish}

  s.rubyforge_project = "rlp-semantics"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
