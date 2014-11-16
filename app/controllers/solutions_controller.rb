class SolutionsController < ApplicationController
  before_action :require_login!

  def new
    @solution = problem.solutions.new
  end

  def create
    @solution = current_user.solutions.new(solution_params) { |s| s.problem = problem }
    if @solution.save
      redirect_to problem, notice: I18n.t('solutions.create.success')
    else
      flash.now[:alert] = I18n.t("solutions.create.error")
      render :new
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
