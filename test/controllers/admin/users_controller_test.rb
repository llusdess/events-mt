# frozen_string_literal: true
require "test_helper"
require "action_policy/test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  include ActionPolicy::TestHelper

  setup do
    @user = create(:user, :admin_user)
    create(:organization_user, user: @user, organization: create(:organization))
  end

  test "should get :index" do
    get admin_users_url(as: @user)
    assert_response :success
  end

  test "should show user :show" do
    get admin_user_url(id: @user.id, as: @user)
    assert_response :success
  end
end
