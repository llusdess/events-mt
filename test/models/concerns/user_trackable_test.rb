# frozen_string_literal: true
require "test_helper"

class UserTrackableTest < ActiveSupport::TestCase
  test "should read failed_attempts from database when incrementing" do
    user = create(:user)
    initial_failed_attempts = user.failed_attempts
    same_user = User.find(user.id)

    user.increment_failed_attempts
    same_user.increment_failed_attempts

    assert_equal initial_failed_attempts + 2, user.reload.failed_attempts
  end

  test "update_tracked_fields and persist changes" do
    user = create(:user)
    request = mock
    request.stubs(:remote_ip).returns("127.0.0.1")

    assert_nil user.current_sign_in_ip
    assert_nil user.last_sign_in_ip
    assert_nil user.current_sign_in_at
    assert_nil user.last_sign_in_at
    assert_equal 0, user.sign_in_count

    user.update_trackable_fields(request)

    assert_equal "127.0.0.1", user.current_sign_in_ip.to_s
    assert_equal "127.0.0.1", user.last_sign_in_ip.to_s
    assert_not_nil user.current_sign_in_at
    assert_not_nil user.last_sign_in_at
    assert_equal 1, user.sign_in_count
  end
end
