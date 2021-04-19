# frozen_string_literal: true
require "test_helper"

class OrganizationUsersTest < ActiveSupport::TestCase
  test "roles enum values" do
    assert ActiveRecord::Base.connection.column_exists?(:organization_users, :role, :enum)
    assert_equal(%w(owner administrator manager staff assistant collaborator).sort, OrganizationUser.roles.keys.sort)
  end

  test "has valid organization user with admin role" do
    organization_user = create(:organization_user, :admin_role)
    assert organization_user.user.valid?
  end
end
