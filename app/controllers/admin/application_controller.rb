# frozen_string_literal: true
module Admin
  class ApplicationController < ApplicationController
    include ActionPolicy::Controller
    include SetCurrentRequestAttributes

    before_action :require_login
    before_action :redirect_unless_organization_set
    before_action :set_active_navigation

    authorize :user, through: :current_user
    verify_authorized

    layout "admin"

    # add_breadcrumb "Home", :admin_dashboard_path

    private

    def redirect_unless_organization_set
      redirect_to(admin_root_path) unless Current.organization
    end

    def set_active_navigation
      navigation["Admin::Main"].activate(nil)
    end
  end
end
