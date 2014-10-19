class WelcomeController < ApplicationController
  before_filter :require_not_logged_in!, only: [ :regwall ]

  def index
    render :regwall, layout: 'full' unless logged_in?
  end

  def regwall
    render layout: 'full'
  end
end
