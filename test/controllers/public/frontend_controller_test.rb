# frozen_string_literal: true
require "test_helper"

class Public::FrontentControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get root_path
    assert_response :success
  end
end
