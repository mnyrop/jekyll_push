# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'jekyll_push'
  spec.version       = '0.1.0'
  spec.authors       = ['marii']
  spec.email         = ['m.s.nyrop@gmail.com']

  spec.summary       = 'gem to push a compiled jekyll site to a github branch'
  spec.description   = 'gem to push a compiled jekyll site to a github branch'
  spec.homepage      = 'https://github.com/mnyrop/jekyll_push'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'jekyll', '> 3.0', '< 4.0'
  spec.add_runtime_dependency 'rainbow', '~> 3.0'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
