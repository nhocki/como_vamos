class ProfilesController < ApplicationController
  before_action :require_login!
  def show
    @user = current_user
  end

  def update
    if current_user.update(profile_params)
      redirect_to profile_url, notice: I18n.t("profiles.update.success")
    else
      redirect_to profile_url, alert: I18n.t("profiles.update.error")
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :username)
  end
end
