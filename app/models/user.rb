class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :provider, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: { allow_nil: true, allow_blank: true }
  validates :provider_uid, presence: true, uniqueness: { scope: :provider }

  has_many :solutions
  has_many :solved_problems, through: :solutions, class_name: 'Problem', source: :problem
  has_many :problems, foreign_key: :creator_id # Problems the user has created, not solved!

  def self.from_omniauth(auth)
    info = auth['info']
    User.where(provider: auth['provider'], provider_uid: auth['uid']).first_or_create do |user|
      user.name = info['name']
      user.email = info['email']
      user.username = info['nickname']
    end
  end

  def profile_ready?
    email.present? && name.present?
  end

  def to_s
    name.presence || username
  end

  def avatar(size: 96)
    gravatar_id = Digest::MD5.hexdigest(email.try(:downcase) || 'hello@comovamos.co')
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  private

  def should_generate_new_friendly_id?
    username_changed?
  end
end
