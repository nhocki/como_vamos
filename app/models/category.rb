class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order(:name) }

  has_many :categorizations
  has_many :problems, through: :categorizations

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
