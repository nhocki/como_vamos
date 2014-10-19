class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :name, :provider, presence: true
  validates :username, :email, presence: true, uniqueness: true
  validates :provider_uid, presence: true, uniqueness: { scope: :provider }
end
