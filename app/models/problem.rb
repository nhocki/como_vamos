class Problem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  DIFFICULTY_MAP = {
    0 => I18n.t("problems.difficulties.easy"),
    1 => I18n.t("problems.difficulties.moderate"),
    2 => I18n.t("problems.difficulties.difficult"),
    3 => I18n.t("problems.difficulties.expert"),
  }

  belongs_to :judge, counter_cache: true
  belongs_to :creator, class_name: "User"

  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :solutions

  validates :title, :url, :judge_id, presence: true
  validates :number, presence: true, uniqueness: { scope: :judge_id }
  validates :difficulty_level, numericality: { only_integer: true }, inclusion: { in: DIFFICULTY_MAP.keys }, presence: true

  delegate :name, to: :judge, prefix: true

  def name
    "#{number} - #{title}"
  end

  def difficulty
    DIFFICULTY_MAP[difficulty_level]
  end

  def to_s
    title
  end
end
