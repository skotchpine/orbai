# frozen_string_literal: true

require_relative "lib/orbai/version"

Gem::Specification.new do |spec|
  spec.name = "orbai"
  spec.version = Orbai::VERSION
  spec.authors = ["Tyler Cinnamon"]
  spec.email = ["tyler at techlitafrica.org"]

  spec.summary = "Orbai is an idiomatic Ruby DSL for OpenAI's powerful API"
  spec.description = <<~DESC
    Welcome to `orbai`, an idiomatic Ruby DSL for OpenAI's powerful API. With the
    combination of Ruby's natural language processing strengths and OpenAI's
    advanced capabilities, your applications are set to take a massive leap forward.
  DESC

  spec.homepage = "https://github.com/skotchpine/orbai"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
