class WelcomeController < ApplicationController
  before_filter :require_not_logged_in!, only: [ :regwall ]

  def index
    if logged_in?
      @title = I18n.t('title.welcome.logged_in')
    else
      @full_layout = true
      @title = I18n.t('title.default')
      render :regwall
    end
  end

  def regwall
    @full_layout = true
    @title = I18n.t('title.default')
  end

  def letsencrypt
    render text: Rails.application.secrets.letsencrypt
  end
end
