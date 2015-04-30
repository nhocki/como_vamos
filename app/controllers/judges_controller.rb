class JudgesController < ApplicationController
  before_action :require_login!, except: [ :index, :show ]

  def index
    @judges = Judge.page(page)
  end

  def show
    @judge = Judge.friendly.find(params[:id])
    @problems = filter_problems(@judge.problems)
  end

  def new
    @judge = Judge.new
  end

  def create
    @judge = Judge.new(judge_params)
    if @judge.save
      track_event('Judge Created', @judge.as_json)
      redirect_to @judge, notice: I18n.t("judges.create.success")
    else
      flash.now[:alert] = I18n.t("judges.create.error")
      render :new
    end
  end

  private

  def judge_params
    params.require(:judge).permit(:name, :url)
  end
end
