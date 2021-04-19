# frozen_string_literal: true
FactoryBot.define do
  factory :person do
    first_name { "Weissnat" }
    last_name { "Octavia" }
    prefered_name { nil }
    prefix { "Mrs" }
    suffix { nil }
    degrees { nil }
    tags { nil }
    email { "octavia_weissnat@example.org" }
    company { false }
    company_name { nil }
    title { nil }
    country_code { "US" }
    cell { nil }
    phone { nil }
    phone_extension { nil }
    fax { nil }
    fax_extension { nil }
  end
end
