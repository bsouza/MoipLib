# -*- encoding: utf-8 -*-
require File.expand_path('../lib/moiplib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bruno Souza"]
  gem.email         = ["to.bsouza@gmail.com"]
  gem.description   = "Simple payment with Moip"
  gem.summary       = "Simple lib to Moip payment"
  gem.homepage      = "https://github.com/bsouza/MoipLib"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "moiplib"
  gem.require_paths = ["lib"]
  gem.files = [
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/moiplib.rb",
    "lib/moiplib/buy.rb",
    "lib/moiplib/buyer.rb",
    "lib/moiplib/card.rb",
    "lib/moiplib/config.rb",
    "lib/moiplib/version.rb",
    "lib/moiplib/actions/direct_payment.rb",
  ]
  gem.version       = Moiplib::VERSION
end
