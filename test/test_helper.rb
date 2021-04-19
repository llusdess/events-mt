# frozen_string_literal: true
require "simplecov"
SimpleCov.start(:rails)

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "mocha/minitest"
require "minitest/reporters"
require "clearance/test_unit"

class ActiveSupport::TestCase
  Minitest::Reporters.use!
  FactoryBot.reload
  include FactoryBot::Syntax::Methods

  parallelize(workers: 1)
end
