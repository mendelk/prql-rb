require_relative "lib/prql_rb/version"

Gem::Specification.new do |spec|
  spec.name = "prql_rb"
  spec.version = PrqlRb::VERSION
  spec.authors = [ "Mendel Kramer" ]
  spec.summary = "Compile PRQL to SQL using prqlc"
  spec.description = "Ruby bindings for the PRQL compiler (prqlc), a Rust " \
                     "implementation of the PRQL pipelined query language."
  spec.homepage = "https://github.com/mendelk/prql_rb"
  spec.license = "AGPL-3.0-or-later"
  spec.required_ruby_version = ">= 3.2"

  spec.files = Dir[
    "bin/**/*",
    "ext/**/{Cargo.toml,Cargo.lock,extconf.rb,src/**/*}",
    "lib/**/*.rb",
    "LICENSE",
    "README.md"
  ].reject { |f| File.directory?(f) }
  spec.require_paths = [ "lib" ]
  spec.extensions = [ "ext/prql_rb/extconf.rb" ]

  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage,
    "changelog_uri" => "#{spec.homepage}/releases",
    "rubygems_mfa_required" => "true"
  }

  spec.add_dependency "rb_sys", "~> 0.9"
end