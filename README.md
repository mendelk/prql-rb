# prql-rb

Ruby bindings for the [PRQL compiler](https://prql-lang.org) (`prqlc`), a
Rust implementation of the PRQL pipelined query language.

```ruby
require "prql-rb"

PrqlRb.compile(<<~PRQL)
  from transactions
  filter amount > 100
  select { id, amount }
PRQL
# => SELECT * FROM transactions WHERE amount > 100 ... (SQL)
```

The default target dialect is PostgreSQL. Compilation failures raise
`PrqlRb::CompileError`. No SQL is ever executed.

## Installation

Add to your Gemfile:

```ruby
gem "prql-rb"
```

Precompiled platform gems are published for `aarch64-linux`,
`x86_64-linux`, `arm64-darwin` and `x86_64-darwin`, so `bundle install`
works without a Rust toolchain on those platforms. Other platforms
build from source (requires Ruby 3.2+, Rust 1.85+).

## API

- `PrqlRb.compile(source, target:, format:, signature_comment:)` —
  compile PRQL source to a SQL string.
  - `target` — SQL dialect, e.g. `"sql.postgres"` (default),
    `"sql.sqlite"`, `"sql.ansi"`.
  - `format` — pretty-print the output SQL (default `true`).
  - `signature_comment` — append the compiler signature as a comment
    (default `false`).
- `PrqlRb.compiler_version` — the bundled prqlc version.

## Development

```sh
bin/setup   # bundle install + compile the extension
rake        # clobber + compile + test
```

To release: tag a commit `vX.Y.Z` and push — CI builds the platform
gems, attaches them to the GitHub release, and pushes everything to
RubyGems.org.

## License

AGPL-3.0-or-later