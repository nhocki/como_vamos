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
    [
      "100 - The 3n + 1 problem",
      "101 - The Blocks Problem",
      "102 - Ecological",
      "103 - Stacking Boxes",
      "104 - Arbitrage",
      "105 - The Skyline Problem",
      "106 - Fermat vs Pythagoras",
    ].sample
  end

  def random_category(limit = 1)
    sidebar_categories.sample(limit)
  end

  def sidebar_categories
    Category.order('name')
  end
end
