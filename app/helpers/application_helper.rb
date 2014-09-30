module ApplicationHelper
  def content_or_partial(content, partial = nil)
    partial ||= content
    content_for?(content) ? content_for(content) : render( content.to_s)
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
    categories.sample(limit)
  end

  def categories
    [
      "dynamic programming",
      "graphs",
      "greedy",
      "complete search",
      "ad hoc",
      "simulation",
      "backtracking",
      "hashes",
      "search",
      "sorting",
    ].sort
  end
end
