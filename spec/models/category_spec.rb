require 'rails_helper'

RSpec.describe Category, :type => :model do
  let!(:category) { Category.create(name: 'dynamic programming') }

  it "has friendy id" do
    expect(Category.friendly.find('dynamic-programming')).to eql(category)
  end
end
