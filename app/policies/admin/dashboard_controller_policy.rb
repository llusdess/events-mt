# frozen_string_literal: true
module Admin
  class DashboardControllerPolicy < ApplicationPolicy
    def show?
      true
    end
  end
end
