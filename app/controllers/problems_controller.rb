class ProblemsController < ApplicationController
  before_action :require_login!, except: [ :index, :show ]

  def index
    @problems = Problem.order(:created_at)
  end

  def show
    @problem = Problem.friendly.find(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.problems.new(problem_params)
    if @problem.save
      redirect_to @problem, notice: I18n.t('problems.create.success')
    else
      flash.now[:alert] = I18n.t("problems.create.error")
      render :new
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:judge_id, :url, :title, :number, { category_ids: [ ]})
  end
end
