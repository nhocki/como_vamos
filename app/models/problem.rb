class Problem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :judge, counter_cache: true
  belongs_to :creator, class_name: "User"

  has_many :categorizations
  has_many :categories, through: :categorizations

  has_many :solutions

  validates :title, :url, :judge_id, presence: true
  validates :number, presence: true, uniqueness: { scope: :judge_id }

  delegate :name, to: :judge, prefix: true

  def name
    "#{number} - #{title}"
  end
end
