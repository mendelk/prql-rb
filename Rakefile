require "bundler/gem_tasks"
require "rake/extensiontask"
require "rake/testtask"
require "rb_sys/mkmf" unless RUBY_PLATFORM.match?(/mswin|ming|cygwin/)

Dir["ext/prql_rb/Cargo.toml"].each do |ext|
  Rake::ExtensionTask.new("prql_rb/prql_rb") do |t|
    t.ext_dir = File.dirname(ext)
    # Cross-compile fat binaries for these platforms via
    # `rake-compiler-dock` (see .github/workflows/gem.yml).
    t.cross_platform = %w[
      aarch64-linux
      arm64-darwin
      x86_64-linux
      x86_64-darwin
    ]
  end
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.pattern = "test/**/*_test.rb"
end

task default: %i[clobber compile test]