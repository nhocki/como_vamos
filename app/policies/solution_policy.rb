class SolutionPolicy
  attr_reader :user, :solution

  def initialize(user, solution)
    @user, @solution = user, solution
  end

  def update?
    logged_in? && solution.user_id == user.id
  end

  def download?
    logged_in?
  end

  private

  def logged_in?
    user.persisted?
  end
end
