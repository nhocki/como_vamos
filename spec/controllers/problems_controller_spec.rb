require "rails_helper"

RSpec.describe ProblemsController, :type => :controller do
  describe "guest users" do
    it "can't access `new`" do
      get :new
      expect(subject).to redirect_to(root_url)
    end

    it "can't create judges" do
      post :create, problem: attributes_for(:problem)
      expect(subject).to redirect_to(root_url)
    end
  end

  describe "filter by difficulty level" do
    it "will only get the problems for a specific difficulty level" do
      create(:problem, difficulty_level: 1)
      create(:problem, difficulty_level: 2)
      get :index, level: 2
      expect(assigns[:problems].size).to equal(1)
    end
  end
end
