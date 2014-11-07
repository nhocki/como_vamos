class ProblemsController < ApplicationController
  before_action :require_login!, except: [ :index, :show ]

  def index
  end

  def show
  end

  def new
  end

  def create
  end
end
