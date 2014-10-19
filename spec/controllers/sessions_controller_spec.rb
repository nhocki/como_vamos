require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
  before do
    mock_github_omniauth
    controller.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end

  it "redirects the user back to the root url" do
    get :create, provider: 'github'
    expect(subject).to redirect_to(root_url)
  end
end
