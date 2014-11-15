require 'rails_helper'

RSpec.describe Categorization, :type => :model do
  it { expect belong_to(:problem)}
  it { expect belong_to(:category)}

  describe "validations" do
    it { expect validate_presence_of([ :category_id, :problem_id ]) }
    it { expect validate_uniqueness_of(:problem_id).scoped_to(:category_id) }
  end
end
