class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def login_user!(user)
    @current_user = nil
    session[:user_id] = user.id
  end

  helper_method def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method def logged_in?
    !!current_user
  end

  def require_not_logged_in!
    if logged_in? && !params[:force]
      redirect_to root_url and return
    end
  end
end
