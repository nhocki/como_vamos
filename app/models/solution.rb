class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  validates :user, :problem, :explanation, :source_code, presence: true
end
