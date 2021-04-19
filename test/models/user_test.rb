# frozen_string_literal: true
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "returns combined first and last name" do
    user = build(:user, first_name: "Clark", last_name: "Kent")
    assert_equal("Clark Kent", user.name.full)
  end

  test "display name shows familiar name" do
    user = create(:user, :admin_user)
    assert_equal("Admin U.", user.display_name)
  end

  test "user is not a member" do
    user = create(:user)
    org = create(:organization)
    refute user.member_of?(org)
  end

  test "user is a member" do
    user = create(:user)
    org = create(:organization)
    create(:organization_user, user: user, organization: org)
    assert user.member_of?(org)
  end
end
