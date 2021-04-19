# frozen_string_literal: true
module Admin
  class UserPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end
  end
end
