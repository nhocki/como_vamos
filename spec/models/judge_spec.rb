require 'rails_helper'

RSpec.describe Judge, :type => :model do
  it { expect have_many(:problems) }

  describe "validations" do
    it { expect validate_uniqueness_of(:name) }
    it { expect validate_presence_of(:name) }
    it { expect validate_presence_of(:url) }
  end

  it "has friendy id" do
    judge = create(:judge, name: 'Uva Online Judge')
    expect(Judge.friendly.find('uva-online-judge')).to eql(judge)
  end
end
