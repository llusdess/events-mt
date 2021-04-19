# frozen_string_literal: true
require "test_helper"

class CurrentTest < ActiveSupport::TestCase
  test "responds to organization" do
    assert_respond_to Current, :organization
  end

  test "responds to user" do
    assert_respond_to Current, :user
  end
end
