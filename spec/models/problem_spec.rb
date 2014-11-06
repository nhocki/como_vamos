require 'rails_helper'

RSpec.describe Problem, :type => :model do
  it "creates the friendly id from the name" do
    problem = create(:problem, number: '100', title: '3n + 1')
    expect(problem.slug).to eql('100-3n-1')
  end

  it "#name has the number & title" do
    problem = build(:problem, number: '100', title: '3n + 1')
    expect(problem.name).to eql('100 - 3n + 1')
  end
end
