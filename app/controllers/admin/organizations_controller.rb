# frozen_string_literal: true
module Admin
  class OrganizationsController < Admin::ApplicationController
    skip_before_action :set_current_organization
    skip_before_action :redirect_unless_organization_set

    layout "launchpad"

    def index
      authorize!
      @organizations = Current.user&.organizations
    end

    def show
      authorize!
      session[:organization_id] = params["id"]
      redirect_to(admin_dashboard_url)
    end
  end
end
