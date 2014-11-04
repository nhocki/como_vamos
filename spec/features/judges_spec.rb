require "rails_helper"

feature 'Judges' do
  before { mock_omniauth! }

  scenario 'adding a new judge' do
    login
    visit judges_path
    click_link I18n.t('judges.index.add_judge')
    fill_in 'judge_name', with: 'USACO'
    fill_in 'judge_url',  with: 'http://www.usaco.org/'
    click_button I18n.t('helpers.submit.create', model: Judge)
    expect(current_path).to eql(judge_path('usaco'))
    expect(page).to have_content('USACO')
  end
end
