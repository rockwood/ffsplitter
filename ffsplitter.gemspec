# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffsplitter/version'

Gem::Specification.new do |spec|
  spec.name          = "ffsplitter"

  spec.version       = FFSplitter::VERSION
  spec.authors       = ["Kevin Rockwood"]
  spec.email         = ["kevin@rockwood.me"]
  spec.description   = %q{Split video files into chapters}
  spec.summary       = %q{ffsplitter will split a video file by its chapters}
  spec.homepage      = "http://github.com/rockwood/ffsplitter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "virtus", '~> 1.0', '>= 1.0.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", '~> 10.0', '>= 10.0.0'
  spec.add_development_dependency "rspec", '~> 2.0', '>= 2.0.0'
end
