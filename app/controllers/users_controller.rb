class UsersController < ApplicationController
  def index
    @users = User.order(:name).page(page)
  end

  def show
    @user = User.friendly.find(params[:id])
    @problems = filter_problems(@user.solved_problems.includes(:judge,:categories))
  end
end
