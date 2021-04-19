# frozen_string_literal: true
module FormatEmailAddress
  extend ActiveSupport::Concern

  def email=(em)
    em = em.downcase.strip if em
    super
  end
  alias_method :email_address=, :email=
end
