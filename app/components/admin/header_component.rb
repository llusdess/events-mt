# frozen_string_literal: true
module Admin
  class HeaderComponent < ViewComponent::Base
    def initialize(show_icon: false)
      @show_icon = show_icon
      @organization = organization
      super
    end

    def organization
      Current.organization || ""
    end
  end
end
