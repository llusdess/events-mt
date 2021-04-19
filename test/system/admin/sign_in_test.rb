# frozen_string_literal: true
require "application_system_test_case"

class Admin::PeopleTest < ApplicationSystemTestCase
  setup do
    @user = create(:user, :admin_user)
  end

  test "sign in as admin user" do
    visit sign_in_url
    fill_in "session_email", with: @user.email
    fill_in "session_password", with: @user.password
    click_on "Sign in"
  end
end
