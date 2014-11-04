require 'rails_helper'

RSpec.describe Judge, :type => :model do
  describe "validations" do
    it { expect validate_uniqueness_of(:name) }
    it { expect validate_presence_of(:name) }
  end

  it "has friendy id" do
    judge = Judge.create(name: 'Uva Online Judge')
    expect(Judge.friendly.find('uva-online-judge')).to eql(judge)
  end
end
