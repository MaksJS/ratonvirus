# frozen_string_literal: true

require "simplecov"

require "ratonvirus"

require_relative "helpers"

RSpec.configure do |config|
  config.include Ratonvirus::Test::Helpers

  config.before do
    # Reset the config before each test
    Ratonvirus.reset

    # We need a file storage to be defined for some of the tests so that they
    # can run the `scanner.virus?` properly without a NotDefinedError.
    #
    # Also make sure no addons are applied for the sake of not interfering with
    # the default tests. For example, testing the Eicar scanner would cause the
    # infected test file to be removed when detected with the default
    # configuration.
    Ratonvirus.configure do |rv_config|
      rv_config.storage = :filepath
      rv_config.addons = []
    end
  end
end
