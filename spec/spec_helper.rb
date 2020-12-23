# frozen_string_literal: true

require "ten_pin_bowling"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.before { allow($stdout).to receive(:puts) }

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def fixture_path(filename)
  File.dirname(__FILE__) + "/fixtures/#{filename}"
end
