# frozen_string_literal: true
module Admin
  class PersonPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end

    def new?
      true
    end

    def edit?
      true
    end

    def create?
      true
    end

    def update?
      true
    end

    def destroy?
      true
    end
  end
end
