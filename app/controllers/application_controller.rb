class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  helper_method def full_layout?
    !!@full_layout
  end

  def login_user!(user)
    logout_user!
    session[:user_id] = user.id
  end

  def logout_user!
    @current_user = session[:user_id] = nil
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

  def require_login!
    if !logged_in? || params[:force]
      redirect_to root_url, alert: I18n.t("application.login_required") and return
    end
  end
end
