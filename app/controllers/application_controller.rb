# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Clearance::Controller
  add_flash_types :info, :error, :warning, :success
end
