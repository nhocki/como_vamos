class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:id])
    @problems = filter_problems(@category.problems)
  end
end
