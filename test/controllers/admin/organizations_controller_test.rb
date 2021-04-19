# frozen_string_literal: true
require "test_helper"

class Admin::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, :admin_user)
    @org  = create(:organization)
    create(:organization_user, user: @user, organization: @org)
    create(:organization_user, user: @user, organization: create(:organization, name: "Org 2"))
  end

  test "should get :index" do
    get admin_organizations_path(as: @user)
    assert_response :success
  end

  test "should redirect to dashboard on show" do
    get admin_organization_path(as: @user, id: @org.slug)
    assert_redirected_to admin_dashboard_url
  end
end
