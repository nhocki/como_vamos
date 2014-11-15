class WelcomeController < ApplicationController
  before_filter :require_not_logged_in!, only: [ :regwall ]

  def index
    unless logged_in?
      @full_layout = true
      render :regwall
    end
  end

  def regwall
    @full_layout = true
  end
end
