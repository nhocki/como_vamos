require "rails_helper"

describe "Problems" do
  before do
    mock_omniauth!
    login
  end

  describe "Adding a problem" do
    let!(:judge) { create(:judge) }
    let!(:category) { create(:category) }

    before do
      visit problems_path
      click_link I18n.t('problems.index.add')
    end

    scenario 'an authenticated user is creating a problem with no errors' do
      fill_in 'problem_number', with: '100'
      fill_in 'problem_title', with: '3n + 1'
      fill_in 'problem_url', with: 'http://uva.onlinejudge.org/external/1/100.html'
      select judge.name, from: 'problem_judge_id'
      select category.name, from: 'problem_category_ids'
      select I18n.t('problems.difficulties.moderate'), from: 'problem_difficulty_level'
      click_button I18n.t('helpers.submit.create', model: Problem)
      expect(page).to have_content(I18n.t('problems.create.success'))
      expect(page).to have_content('100 - 3n + 1')
      expect(current_path).to eql(problem_path('100-3n-1'))

      problem = Problem.first
      expect(problem).not_to be_nil
      expect(problem.categories.pluck(:name)).to eql([ category.name ])
      expect(problem.difficulty).to eql(I18n.t('problems.difficulties.moderate'))
    end

    scenario 'with errors on the form' do
      fill_in 'problem_number', with: '100'
      select judge.name, from: 'problem_judge_id'
      click_button I18n.t('helpers.submit.create', model: Problem)
      expect(page).to have_content(I18n.t('problems.create.error'))
      expect(Problem.count).to eql(0)
      expect(current_path).to eql(problems_path)
    end
  end
end
