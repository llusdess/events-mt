# frozen_string_literal: true
class AvatarComponent < ViewComponent::Base
  VALID_AVATAR_SIZES = %w[xs sm md lg xl xxl]

  def initialize(email: nil, name: nil, size: 40)
    super
    @email = email
    @name = name
    @size = size
  end

  def gravatar_url(type = "identicon", size = @size)
    "https://www.gravatar.com/avatar/#{hashed_email}?s=#{size}&d=#{type}"
  end

  private

  attr_reader :user, :name

  def render?
    @email.present?
  end

  def hashed_email
    Digest::MD5.hexdigest(@email.downcase)
  end
end
