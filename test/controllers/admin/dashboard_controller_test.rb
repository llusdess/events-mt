# frozen_string_literal: true
require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, :admin_user)
    @org = create(:organization)
    create(:organization_user, user: @user, organization: @org)
  end

  test "should get :show" do
    get admin_dashboard_url(as: @user)
    assert_response :success
  end
end
