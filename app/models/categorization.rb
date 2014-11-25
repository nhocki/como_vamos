class Categorization < ActiveRecord::Base
  belongs_to :problem,  counter_cache: :categories_count
  belongs_to :category, counter_cache: :problems_count

  validates :problem, :category, presence: true
  validates :problem, uniqueness: { scope: :category }
end
