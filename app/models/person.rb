# frozen_string_literal: true
class Person < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  include FormatEmailAddress

  # relationships .............................................................
  # validations ...............................................................
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_plausible_phone :cell
  validates_plausible_phone :phone
  validates_plausible_phone :fax
  validates :email, email: true

  # callbacks .................................................................
  # scopes ....................................................................
  default_scope { order(last_name: :asc, first_name: :asc) }
  scope :people, -> { where(company: false) }
  scope :companies, -> { where(company: true) }
  scope :recent, -> {
                   unscoped
                     .where(created_at: (Date.today - 4.week)..(Date.today.end_of_day))
                     .order(created_at: :asc)
                 }

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  nilify_blanks
  has_person_name
  taggable_array :tags
  taggable_array :degrees

  phony_normalize :cell, default_country_code: "US"
  phony_normalize :phone, default_country_code: "US"
  phony_normalize :fax, default_country_code: "US"

  # class methods .............................................................
  # public instance methods ...................................................
  def display_name
    name.full_name
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
end
