module UsersHelper
  def solutions_and_problems_count_for(user)
    options = {
      problems_count:  pluralize(user.solved_problems.count, t('problem')),
      solutions_count: pluralize(user.solutions_count, t('solution')),
    }
    t('users.user.solutions_and_problems_count', options)
  end
end
