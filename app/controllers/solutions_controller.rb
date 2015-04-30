class SolutionsController < ApplicationController
  before_action :require_login!

  def new
    @solution = problem.solutions.new
  end

  def create
    @solution = current_user.solutions.new(solution_params) { |s| s.problem = problem }
    if @solution.save
      track_event('Solution Created', @solution.as_json(only: [:user_id, :problem_id, :created_at]))
      redirect_to problem, notice: I18n.t('solutions.create.success')
    else
      flash.now[:alert] = I18n.t("solutions.create.error")
      render :new
    end
  end

  def edit
    @solution = current_user.solutions.where(problem: problem).find(params[:id])
  end

  def update
    @solution = current_user.solutions.where(problem: problem).find(params[:id])
    if @solution.update(solution_params)
      track_event('Solution Updated', @solution.as_json(only: [:user_id, :problem_id, :created_at]))
      redirect_to problem, notice: I18n.t('solutions.update.success')
    else
      flash.now[:alert] = I18n.t("solutions.update.error")
    end
  end

  private

  def problem
    @problem ||= Problem.friendly.find(params[:problem_id])
  end

  def solution_params
    params.require(:solution).permit(:explanation, :source_code)
  end
end
