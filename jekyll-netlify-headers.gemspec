lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'jekyll/netlify/headers/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ['>= 2.4', '< 2.8']

  spec.name          = 'jekyll-netlify-headers'
  spec.version       = Jekyll::Netlify::Headers::VERSION
  spec.authors       = ['Jason Garber']
  spec.email         = ['jason@sixtwothree.org']

  spec.summary       = 'Generate a Netlify HTTP headers configuration from a Jekyll configuration.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/jgarber623/jekyll-netlify-headers'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(bin|spec)/}) }

  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.87.1'
  spec.add_development_dependency 'rubocop-performance', '~> 1.6'

  spec.add_runtime_dependency 'jekyll', '>= 3.8'
end
