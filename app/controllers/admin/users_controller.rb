# frozen_string_literal: true
module Admin
  class UsersController < Admin::ApplicationController
    before_action :user, only: [:show]

    add_breadcrumb "Users", :admin_users_path

    def index
      authorize!
      @organization_users = Current.organization&.organization_users&.includes(:user)&.order(:role)
      @role_groups = @organization_users&.group_by(&:role)
    end

    def show
      authorize!
      add_breadcrumb("Details", :admin_users_path)
    end

    private

    def user_params
      params.require(:user).permit(:last_name, :first_name, :email, :username)
    end

    def user
      @user ||= User.find(params[:id])
    end

    def set_active_navigation
      navigation["Admin::Main"].activate(:user_accounts)
    end
  end
end
