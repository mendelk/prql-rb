require_relative "prql_rb/version"

# Try the versioned extension first (precompiled fat gems ship
# lib/prql_rb/<ruby-version>/prql_rb.so), then fall back to a
# source-built extension at lib/prql_rb/prql_rb.so.
begin
  RUBY_VERSION =~ /(\d+\.\d+)/
  require_relative "prql_rb/#{Regexp.last_match(1)}/prql_rb"
rescue LoadError
  require_relative "prql_rb/prql_rb"
end

module PrqlRb
  DEFAULT_TARGET = "sql.postgres"

  def self.compile(source, target: DEFAULT_TARGET, format: true, signature_comment: false)
    native_compile(source, target, format, signature_comment)
  end
end