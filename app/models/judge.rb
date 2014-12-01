class Judge < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order(:name) }

  has_many :problems

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true

  delegate :count, to: :problems, prefix: true

  def to_s
    name
  end
end
