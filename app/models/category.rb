class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :categorizations
  has_many :problems, :through => :categorizations

  validates :name, presence: true, uniqueness: true
end
