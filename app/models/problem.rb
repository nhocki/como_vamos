class Problem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :judge
  belongs_to :creator, class_name: "User"

  validates :title, :url, presence: true
  validates :number, presence: true, uniqueness: { scope: :judge_id }

  def name
    "#{number} - #{title}"
  end
end
