# frozen_string_literal: true
require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  setup do
    @org = build(:organization)
    @user = create(:user)
  end

  test "valid organization" do
    assert @org.valid?
  end

  test "formatted display name" do
    org = build(:organization, name: "justice league")
    assert_equal("Justice League", org.display_name)
  end

  test "status enum values" do
    assert ActiveRecord::Base.connection.column_exists?(:organizations, :status, :enum)
    assert_equal(%w(closed active).sort, Organization.statuses.keys.sort)
  end

  test "does not have a member" do
    refute @org.member?(@user)
  end

  test "has a member" do
    create(:organization_user, user: @user, organization: @org)
    assert @org.member?(@user)
  end
end
