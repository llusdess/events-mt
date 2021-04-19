# frozen_string_literal: true
class Current < ActiveSupport::CurrentAttributes
  attribute :organization, :user, :role
  attribute :request_id, :user_agent, :ip_address
end
