class Categorization < ActiveRecord::Base
  belongs_to :problem
  belongs_to :category

  validates :problem, :category, presence: true
  validates :problem, uniqueness: { scope: :category }
end
