
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_push/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll_push'
  spec.version       = JekyllPush::VERSION
  spec.authors       = ['marii']
  spec.email         = ['m.s.nyrop@gmail.com']

  spec.summary       = 'ruby gem to push a compiled jekyll site to its own github branch'
  spec.description   = 'ruby gem to push a compiled jekyll site to its own github branch'
  spec.homepage      = 'https://github.com/mnyrop/jekyll_push'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
