require "rails_helper"

RSpec.describe JudgesController, :type => :controller do
  describe "guest users" do
    it "can't access `new`" do
      get :new
      expect(subject).to redirect_to(root_url)
    end

    it "can't create judges" do
      post :create, judge: attributes_for(:judge)
      expect(subject).to redirect_to(root_url)
    end
  end
end
