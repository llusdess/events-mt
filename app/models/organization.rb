# frozen_string_literal: true
class Organization < ApplicationRecord
  # extends ...................................................................
  extend FriendlyId

  # includes ..................................................................
  # relationships .............................................................
  has_many :organization_users, dependent: :destroy
  has_many :users, through: :organization_users

  # enums .....................................................................
  enum status: {
    active: "active",
    closed: "closed"
  }

  # validations ...............................................................
  validates_inclusion_of :status, in: statuses.keys
  validates_presence_of :name, :slug, unique: true
  validates_format_of :name, with: /\A[[:alnum:]\s]+\z/

  # callbacks .................................................................
  # scopes ....................................................................
  default_scope { order(name: :asc) }

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  friendly_id :name, use: :slugged

  # class methods .............................................................
  # public instance methods ...................................................
  def to_s
    display_name
  end

  def display_name
    name.humanize.titleize
  end

  def member?(user)
    user.in?(users)
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
end
