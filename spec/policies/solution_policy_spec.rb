require "spec_helper"

describe SolutionPolicy do
  describe "#update?" do
    let(:user) { create(:user) }
    let(:solution) { create(:solution, user: user) }
    let(:policy) { SolutionPolicy.new(user, solution) }

    it "is true when the user owns the policy" do
      expect(policy.update?).to be_truthy
    end

    it "is false when the solution is for another user" do
      policy = SolutionPolicy.new(create(:user), solution)
      expect(policy.update?).to be_falsy
    end
  end
end
