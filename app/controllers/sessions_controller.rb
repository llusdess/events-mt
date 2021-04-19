# frozen_string_literal: true
class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        @user.update_trackable_fields(request)
        redirect_back_or url_after_create
      else
        failed_user = User.find_by(email: params.dig("session", "email"))
        failed_user&.increment_failed_attempts
        flash.now.alert = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end
end
