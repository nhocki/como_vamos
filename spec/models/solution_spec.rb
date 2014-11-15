require 'rails_helper'

RSpec.describe Solution, :type => :model do
  it { expect belong_to(:user) }
  it { expect belong_to(:problem) }
  it { expect validate_presence_of([ :user, :problem, :explanation, :source_code ]) }
end
