# frozen_string_literal: true
FactoryBot.define do
  factory :organization_user, class: "OrganizationUser" do
    organization
    user
    role { "staff" }
  end

  trait :owner_role do
    user { association :user, :owner_user }
    role { "owner" }
  end

  trait :admin_role do
    user { association :user, :admin_user }
    role { "administrator" }
  end
end
