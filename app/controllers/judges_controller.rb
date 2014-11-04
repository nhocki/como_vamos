class JudgesController < ApplicationController
  def index
    @judges = Judge.all
  end

  def show
    @judge = Judge.friendly.find(params[:id])
  end
end
