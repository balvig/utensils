# -*- encoding: utf-8 -*-
require File.expand_path('../lib/utensils/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jens Balvig"]
  gem.email         = ["jens@balvig.com"]
  gem.description   = %q{Rspec stuff we use over and over again}
  gem.summary       = %q{Rspec stuff we use over and over again}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "utensils"
  gem.require_paths = ["lib"]
  gem.version       = Utensils::VERSION
end
