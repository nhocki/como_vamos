require 'rails_helper'

RSpec.describe SolutionsController, :type => :controller do
  describe "guest users" do
    let(:problem) { create(:problem) }
    it "can't access `new`" do
      get :new, problem_id: problem.id
      expect(subject).to redirect_to(root_url)
    end

    it "can't create judges" do
      post :create, solution: attributes_for(:solution), problem_id: problem.id
      expect(subject).to redirect_to(root_url)
    end
  end
end
