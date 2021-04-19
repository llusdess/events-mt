# frozen_string_literal: true
require "test_helper"

class Admin::BackendControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, :admin_user)
  end

  test "should redirect to root if no organization found" do
    get admin_dashboard_url(as: @user)
    assert_redirected_to admin_root_url
  end
end
