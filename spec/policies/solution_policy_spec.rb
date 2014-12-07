require "spec_helper"

describe SolutionPolicy do
  let(:solution) { create(:solution, user: user) }
  let(:user) { create(:user) }

  describe "#update?" do
    let(:policy) { SolutionPolicy.new(user, solution) }

    it "is true when the user owns the policy" do
      expect(policy.update?).to be_truthy
    end

    it "is false when the solution is for another user" do
      policy = SolutionPolicy.new(create(:user), solution)
      expect(policy.update?).to be_falsy
    end
  end

  describe "#download?" do
    it "is true when the user is logged in" do
      policy = SolutionPolicy.new(user, solution)
      expect(policy.download?).to be_truthy
    end

    it "is false when the user not is logged in" do
      policy = SolutionPolicy.new(User.new, solution)
      expect(policy.download?).to be_falsy
    end
  end
end
