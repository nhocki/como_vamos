require "rails_helper"

feature "Login with GitHub" do
  before do
    OmniAuth.config.test_mode = true
    mock_github_omniauth
  end

  scenario "The user is created" do
    visit root_url
    first(:link, "GitHub").click
    expect(page).to have_content("Nicolás Hock Isaza")
  end
end
