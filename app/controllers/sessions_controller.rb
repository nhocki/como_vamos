class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    login_user!(user)
    redirect_to root_path, notice: "You've been logged in!"
  end
end
