require "rails_helper"

feature 'Judges' do
  before do
    mock_omniauth!
    login
    visit judges_path
    click_link I18n.t('judges.index.add_judge')
  end

  scenario 'adding a new judge' do
    fill_in 'judge_name', with: 'USACO'
    fill_in 'judge_url',  with: 'http://www.usaco.org/'
    click_button I18n.t('helpers.submit.create', model: Judge)
    expect(current_path).to eql(judge_path('usaco'))
    expect(page).to have_content('USACO')
  end

  scenario "there's some erros on the input" do
    fill_in 'judge_name', with: 'USACO'
    click_button I18n.t('helpers.submit.create', model: Judge)
    expect(current_path).to eql(judges_path)
    expect(page).to have_content(I18n.t("judges.create.error"))
  end
end
