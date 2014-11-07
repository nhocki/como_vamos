require 'rails_helper'

RSpec.describe Problem, :type => :model do
  it { expect belong_to(:judge) }
  it { expect belong_to(:creator) }
  it { expect have_many(:categories) }
  it { expect have_many(:categorizations) }

  describe "validations" do
    it { expect validate_presence_of([ :title, :url, :number, :judge_id ]) }
  end

  it "creates the friendly id from the name" do
    problem = create(:problem, number: '100', title: '3n + 1')
    expect(problem.slug).to eql('100-3n-1')
  end

  it "#name has the number & title" do
    problem = build(:problem, number: '100', title: '3n + 1')
    expect(problem.name).to eql('100 - 3n + 1')
  end
end
