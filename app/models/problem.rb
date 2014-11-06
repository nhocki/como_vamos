class Problem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :judge
  belongs_to :creator, class_name: "User"

  def name
    "#{number} - #{title}"
  end
end
