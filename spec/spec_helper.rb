# frozen_string_literal: true

require 'bundler/setup'
require 'my_hangman'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # suppress $STDOUT in terminal
  config.before { allow($stdout).to receive(:puts) }

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require_relative '../lib/my_hangman.rb'
