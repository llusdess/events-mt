# frozen_string_literal: true
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A.+@.+\..+\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
