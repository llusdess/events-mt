# frozen_string_literal: true
module Admin
  class OrganizationPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end
  end
end
