# frozen_string_literal: true
class OrganizationUser < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................
  belongs_to :organization, touch: true, counter_cache: :users_count
  belongs_to :user, touch: true

  # enums .....................................................................
  enum role: {
    owner:         "owner",
    administrator: "administrator",
    manager:       "manager",
    staff:         "staff",
    assistant:     "assistant",
    collaborator:  "collaborator"
  }

  # validations ...............................................................
  validates_inclusion_of :role, in: roles.keys

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  # class methods .............................................................
  # public instance methods ...................................................
  delegate :name, to: :user
  delegate :email, to: :user
  delegate :last_sign_in_at, to: :user
  delegate :last_sign_in_ip, to: :user

  # protected instance methods ................................................
  # private instance methods ..................................................
end
