require "rails_helper"

feature "Editing profile" do
  before do
    mock_omniauth!
    login
  end

  scenario "Users can change their profiles" do
    visit profile_url
    fill_in 'profile_name', with: "A new name"
    click_button I18n.t('profiles.show.update_btn')
    expect(page).to have_content("A new name")
  end
end
