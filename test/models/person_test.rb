# frozen_string_literal: true
require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "builds valid person" do
    assert build(:person).valid?
  end

  test "formats email" do
    chris = build(:person, email: " CborN@llu.edu ")
    assert_equal "cborn@llu.edu", chris.email
  end

  test "formats email through email_address" do
    chris = build(:person)
    chris.email_address = " CborN@llu.edu "
    assert_equal "cborn@llu.edu", chris.email
  end

  test "email valid with filter" do
    chris = build(:person, email: "cborn+filter@llu.edu")
    assert chris.valid?
  end

  test "email invalid if missing @" do
    chris = build(:person, email: "cborn.llu.edu")
    refute chris.valid?
  end
end
