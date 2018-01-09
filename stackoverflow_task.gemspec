# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stackoverflow_task/version'

Gem::Specification.new do |spec|
  spec.name          = 'stackoverflow_task'
  spec.version       = StackoverflowTask::VERSION
  spec.authors       = ['Daniel Romero Vega']
  spec.email         = ['dromveg@gmail.com']
  spec.summary       = %q{Find tags for programming languages.}
  spec.description   = %q{Given a list of programming languages, find the number of tags for each one on stackoverflow.}
  spec.homepage      = 'https://github.com/dnlR/stackoverflow_task'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'pry-byebug', '~> 2.0.0'

  spec.add_dependency 'nokogiri', '~> 1.6.0'
  spec.add_dependency 'thor', '~> 0.19.1'
  spec.add_dependency 'awesome_print', '~> 1.2.0'
end
