class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    login_user!(user)
    redirect_back_or_to(root_path, notice: I18n.t("sessions.create.success"))
  end

  def destroy
    logout_user!
    redirect_to root_path, notice: I18n.t("sessions.destroy.success")
  end
end
