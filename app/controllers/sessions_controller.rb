class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    login_user!(user)
    redirect_to root_path, notice: I18n.t("sessions.create.success")
  end
end
