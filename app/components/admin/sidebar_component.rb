# frozen_string_literal: true
module Admin
  class SidebarComponent < ViewComponent::Base
    def initialize(navigation:)
      super
      @navigation = navigation
    end
  end
end
