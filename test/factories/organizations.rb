# frozen_string_literal: true
FactoryBot.define do
  factory :organization do
    status { "active" }
    name { "Development Organization" }
    sequence(:slug) { |n| "dev-org-#{n}" }
  end

  trait :closed do
    status { "closed" }
    name { "Closed Organization" }
    slug { "closed-org" }
  end
end
