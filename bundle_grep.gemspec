
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bundle_grep/version"
require "bundler"

Gem::Specification.new do |spec|
  spec.name          = "bundle_grep"
  spec.version       = BundleGrep::VERSION
  spec.authors       = ["Tieg Zaharia"]
  spec.email         = ["tieg.zaharia@gmail.com"]

  spec.summary       = %q{A Bundler plugin that lets you grep libraries in your bundle.}
  spec.description   = %q{Curious where a method, error or just some text originates? Check your bundled libraries with bundle grep!}
  spec.homepage      = "https://github.com/tiegz/bundle_grep"
  spec.license       = "MIT"
  spec.cert_chain    = ['certs/tiegz.pem']
  spec.signing_key   = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/tiegz/bundle_grep"
    spec.metadata["changelog_uri"] = "https://github.com/tiegz/bundle_grep/tree/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
