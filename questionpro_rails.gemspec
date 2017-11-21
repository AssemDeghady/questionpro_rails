
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "questionpro_rails/version"

Gem::Specification.new do |spec|
  spec.name          = "questionpro_rails"
  spec.version       = QuestionproRails::VERSION
  spec.authors       = ["Assem Deghady"]
  spec.email         = ["assem.deghady@gmail.com"]

  spec.summary       = %q{An Api Wrapper for QuestionPro's Surveys Services.}
  spec.description   = %q{An Api Wrapper for QuestionPro's Surveys Services.}
  spec.homepage      = "https://github.com/AssemDeghady/questionpro_rails"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "httparty"
end
