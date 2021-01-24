# -*- encoding: utf-8 -*-
require File.expand_path('../lib/finmodeling/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jim Lindstrom"]
  gem.email         = ["jim.lindstrom@gmail.com"]
  gem.description   = %q{A gem for manipulating XBRL financial filings}
  gem.summary       = %q{A gem for manipulating XBRL financial filings}
  gem.homepage      = "https://github.com/jimlindstrom/FinModeling"
  gem.license       = "MIT"

  gem.add_dependency("fileutils")
  gem.add_dependency("sec_query")
  gem.add_dependency("edgar")

  gem.add_dependency("xbrlware-ruby19", "1.1.2.19.2")
  gem.add_dependency("xbrlware-extras", "1.1.2.19.3")
  gem.add_dependency("nasdaq_query")

  gem.add_dependency("naive_bayes")
  gem.add_dependency("statsample")
  gem.add_dependency("yahoofinance")
  gem.add_dependency("gsl")

  gem.add_development_dependency("rspec", "2.5")
  gem.add_development_dependency("rake")

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "finmodeling"
  gem.require_paths = ["lib"]
  gem.version       = FinModeling::VERSION
end
