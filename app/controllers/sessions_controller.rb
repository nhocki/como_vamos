class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])

    unless user.persisted?
      auth = env['omniauth.auth']
      info = auth['info']
      Rails.logger.error{"OmniAuth Error: #{info['nickname']} #{user.errors.inspect}"}
      redirect_to root_path, alert: I18n.t("sessions.create.error") and return
    end

    track_event('Signed Up', user.as_json) if user.created_at >= 1.minute.ago

    login_user!(user)
    redirect_back_or_to(root_path, notice: I18n.t("sessions.create.success"))
  end

  def destroy
    logout_user!
    redirect_to root_path, notice: I18n.t("sessions.destroy.success")
  end
end
