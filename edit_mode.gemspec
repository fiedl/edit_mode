# -*- encoding: utf-8 -*-
require File.expand_path('../lib/edit_mode/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sebastian Fiedlschuster"]
  gem.email         = ["sebastian@fiedlschuster.de"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "edit_mode"
  gem.require_paths = ["lib"]
  gem.version       = EditMode::VERSION
end
