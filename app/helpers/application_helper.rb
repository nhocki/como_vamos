module ApplicationHelper
  def localized_key(key)
    "#{I18n.locale}/#{key}"
  end

  def content_or_partial(content, partial = nil)
    partial ||= content
    content_for?(content) ? content_for(content) : render( content.to_s)
  end

  def login_path(provider = :github)
    "/auth/#{provider}"
  end

  def random_problem
    Problem.all.to_a.sample
  end

  def random_category(limit = 1)
    sidebar_categories.sample(limit)
  end

  def sidebar_categories
    @sidebar_categories ||= Category.order('name')
  end

  def random_user
    User.all.sample
  end

  def random_judge
    Judge.all.sample
  end
end
