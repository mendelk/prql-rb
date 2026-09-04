require "bundler/gem_tasks"
require "rake/testtask"
require "rb_sys/extensiontask"

GEMSPEC = Gem::Specification.load(File.expand_path("prql-rb.gemspec", __dir__))

RbSys::ExtensionTask.new("prql_rb", GEMSPEC) do |ext|
  ext.lib_dir = "lib/prql_rb"
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.pattern = "test/**/*_test.rb"
end

task default: %i[clobber compile test]
