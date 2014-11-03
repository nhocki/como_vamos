require "rails_helper"

feature "Users" do
  before do
    OmniAuth.config.test_mode = true
    mock_github_omniauth
  end

  scenario "Anonymous users can access the list of users" do
    user = create(:user)
    visit root_url
    first(:link, "Users").click
    expect(page).to have_content(user.name)
  end

  scenario "Anonymous users can access a profile of a user" do
    user = create(:user)
    visit users_url
    click_link(user.name)
    expect(page).to have_content(user.name)
  end
end
