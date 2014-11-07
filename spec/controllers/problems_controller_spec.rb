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
end
