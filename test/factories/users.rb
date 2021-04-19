# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    username { "user" }
    first_name { "Default" }
    last_name { "User" }
    email { "default_user@example.com" }
    password { "pa$$w0rd!" }
    person
  end

  trait :owner_user do
    username { "owner" }
    first_name { "Owner" }
    last_name { "User" }
    email { "owner@example.com" }
  end

  trait :admin_user do
    username { "admin" }
    first_name { "Admin" }
    last_name { "User" }
    email { "admin@example.com" }
  end

  trait :noname_user do
    first_name { nil }
    last_name { nil }
    username { "noname" }
  end
end
