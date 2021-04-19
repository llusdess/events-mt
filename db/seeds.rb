# frozen_string_literal: true
require "faker"

# Setup Admin User and Development Organization
person = Person.create!(
  first_name: "Admin",
  last_name:  "Person",
  email:      "admin.person@example.com"
)

admin = User.create!(username:   "admin",
                     first_name: "Admin",
                     last_name:  "Person",
                     email:      "admin@example.com",
                     password:   "pa$$w0rd!",
                     person:     person)

dev_org = Organization.create!(name: "Development Organization", status: :active)

OrganizationUser.create(organization: dev_org, user: admin, role: :owner)

# Seed some random people
30.times do
  Person.create(
    first_name:      first = Faker::Name.unique.first_name,
    last_name:       last = Faker::Name.unique.last_name,
    prefered_name:   "",
    prefix:          Faker::Name.prefix,
    suffix:          "",
    degrees:         [Faker::Name.suffix],
    tags:            [],
    email:           Faker::Internet.safe_email(name: "#{first}.#{last}"),
    company:         co = Faker::Boolean.boolean(true_ratio: 0.2),
    company_name:    co ? Faker::Company.name : "",
    title:           co ? Faker::Job.title : "",
    country_code:    "US",
    cell:            Faker::PhoneNumber.cell_phone,
    phone:           Faker::PhoneNumber.cell_phone,
    phone_extension: "",
    fax:             "",
    fax_extension:   "",
  )
end
