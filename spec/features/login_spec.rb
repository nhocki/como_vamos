require "rails_helper"

feature "Login with GitHub" do
  before do
    mock_omniauth!
  end

  scenario "The user is created" do
    visit root_url
    first(:link, "GitHub").click
    expect(page).to have_content("Nicolás Hock Isaza")
  end
end

feature "Log out from Como Vamos" do
  before do
    mock_omniauth!(info: { name: 'Some Name' })
    login
  end

  scenario "The user gets logged out" do
    expect(page).to have_content("Some Name")
    visit root_url
    click_link(I18n.t('application.header.logout'))
    expect(page).to have_content(I18n.t('sessions.destroy.success'))
    expect(page).not_to have_content("Some Name")
  end
end
