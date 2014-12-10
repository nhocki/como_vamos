class UsersController < ApplicationController
  def index
    @users = User.order(:name).page(page)
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
