# -*- encoding: utf-8 -*-
require File.expand_path('../lib/edit_mode/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sebastian Fiedlschuster"]
  gem.email         = ["sebastian@fiedlschuster.de"]
  gem.description   = %q{The edit mode is activated by pressing an 'edit' button on a show view. This shows additional editing tools and switches on the best_in_place form fields. When editing is finished, use 'save' or 'cancel' buttons to quit the edit mode and return to a normal show view. Several editing groups per page are supported. Thus, you can have several 'boxes' to edit on a page.}
  gem.summary       = %q{Toggle an edit mode on a show view. Think of it as a grouped in-place editing.}
  gem.homepage      = "https://github.com/fiedl/edit_mode"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "edit_mode"
  gem.require_paths = ["lib"]
  gem.version       = EditMode::VERSION

  gem.add_development_dependency "rspec"
end
