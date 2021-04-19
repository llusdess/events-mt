# frozen_string_literal: true
require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "sign in count is incremented" do
    admin_user = create(:user, :admin_user)
    assert_difference("admin_user.sign_in_count", +1) do
      post session_url(params: { session: { email: admin_user.email, password: admin_user.password } })
      admin_user.reload
    end
    assert_redirected_to root_url
  end

  test "test failed sign in attempts in incremented" do
    admin_user = create(:user, :admin_user)
    assert_difference("admin_user.failed_attempts", +1) do
      post session_url(params: { session: { email: admin_user.email, password: "bad password" } })
      admin_user.reload
    end
    assert_response :unauthorized
  end
end
