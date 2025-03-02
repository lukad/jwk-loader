# frozen_string_literal: true

require "webmock"
require "vcr"
require "simplecov"
require "jwt"

SimpleCov.start

require "jwk-loader"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    ::JwkLoader.cache.clear
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into(:webmock)
  config.configure_rspec_metadata!
end
