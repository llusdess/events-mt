# frozen_string_literal: true
module SetCurrentRequestAttributes
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    before_action :set_current_organization
    before_action :set_request_id
    before_action :set_user_agent
    before_action :set_ip_address
  end

  private

  def set_current_user
    ::Current.user = current_user
  end

  def set_current_organization
    ::Current.organization = if session[:organization_id]
      Organization.friendly.find(session.dig("organization_id"))
    else
      Current.user&.organizations&.first
    end
  end

  def set_request_id
    ::Current.request_id = request.uuid
  end

  def set_user_agent
    ::Current.user_agent = request.user_agent
  end

  def set_ip_address
    ::Current.ip_address = request.ip
  end
end
