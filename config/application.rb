# frozen_string_literal: true
require_relative "boot"
require "rails/all"
require "dotenv-rails"
require "view_component/engine"

Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module EventsVersionThree
  class Application < Rails::Application
    config.assets.quiet = true
    config.generators do |generator|
      generator.helper(false)
      generator.assets(false)
      generator.jbuilder(false)
      generator.javascripts(false)
      generator.stylesheets(false)
      generator.test_framework(:test_unit, fixture: false)
      generator.factory_bot(true)
    end

    config.to_prepare do
      Clearance::PasswordsController.layout("empty")
      Clearance::SessionsController.layout("empty")
      Clearance::UsersController.layout("empty")
    end

    config.load_defaults(6.0)
    config.active_record.schema_format = :sql

    config.time_zone = "Pacific Time (US & Canada)"
    config.active_record.default_timezone = :utc

    config.autoload_paths += Dir[Rails.root.join("lib", "{**/}")]
  end
end
