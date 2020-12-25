# frozen_string_literal: true

require 'ten_pin_bowling'
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # config.before { allow($stdout).to receive(:puts) }

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def fixture_path(filename)
  File.dirname(__FILE__) + "/fixtures/#{filename}"
end

def capture_stream(stream)
  raise ArgumentError, 'missing block' unless block_given?

  orig_stream = stream.dup
  IO.pipe do |r, w|
    # system call dup2() replaces the file descriptor
    stream.reopen(w)
    # there must be only one write end of the pipe;
    # otherwise the read end does not get an EOF
    # by the final `reopen`
    w.close
    t = Thread.new { r.read }
    begin
      yield
    ensure
      stream.reopen orig_stream # restore file descriptor
    end
    t.value # join and get the result of the thread
  end
end
