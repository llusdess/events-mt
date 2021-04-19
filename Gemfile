# frozen_string_literal: true
source("https://rubygems.org")
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby("2.6.6")

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "redis", "~> 4.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Application Gems
gem "action_policy"
gem "actionnav"
gem "acts-as-taggable-array-on"
gem "clearance"
gem "breadcrumbs_on_rails"
gem "dotenv-rails", require: "dotenv/rails-now"
gem "enumerize"
gem "friendly_id"
gem "high_voltage"
gem "name_of_person"
gem "nilify_blanks"
gem "omniauth-oauth2"
gem "pg_search"
gem "phony_rails"
gem "stimulus_reflex", "~> 3.3.0.pre2"
gem "uuidtools"
gem "view_component"
gem "view_component_reflex"

# Profiling
gem "rack-mini-profiler"
gem "flamegraph"
gem "stackprof"
gem "memory_profiler"

group :development, :test do
  gem "awesome_print"
  gem "better_errors"
  gem "pry-byebug"
  gem "debase"
  gem "factory_bot_rails"
  gem "faker", require: false
  gem "rails-controller-testing"
  gem "rails_real_favicon"
  gem "ruby-debug-ide"
  gem "shoulda"
end

group :development do
  gem "annotate"
  gem "bullet"
  gem "fasterer", require: false
  gem "foreman", require: false
  gem "listen", "~> 3.2"
  gem "ripper-tags", require: false
  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-shopify", require: false
  gem "rubycritic", require: false
  gem "solargraph", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "minitest"
  gem "minitest-reporters"
  gem "mocha"
  gem "selenium-webdriver"
  gem "simplecov", "= 0.17", require: false
  gem "webdrivers"
end

gem("tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby])
