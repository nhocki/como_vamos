class Judge < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :problems

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true
end
