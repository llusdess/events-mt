# frozen_string_literal: true
module Admin
  class DashboardController < Admin::ApplicationController
    def show
      authorize!(current_user, with: Admin::DashboardControllerPolicy)
    end

    private

    def set_active_navigation
      navigation["Admin::Main"].activate(:dashboard)
    end
  end
end
