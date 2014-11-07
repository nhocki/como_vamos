class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :name, :provider, presence: true
  validates :username, :email, presence: true, uniqueness: true
  validates :provider_uid, presence: true, uniqueness: { scope: :provider }

  has_many :problems, foreign_key: :creator_id

  def self.from_omniauth(auth)
    info = auth['info']
    User.where(provider: auth['provider'], provider_uid: auth['uid']).first_or_create! do |user|
      user.name = info['name']
      user.email = info['email']
      user.username = info['nickname']
    end
  end

  def avatar(size: 96)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  private

  def should_generate_new_friendly_id?
    username_changed?
  end
end
