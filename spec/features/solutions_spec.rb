require "rails_helper"

feature 'Solutions' do
  let!(:problem) { create(:problem) }
  let(:path) { Rails.root.join('spec', 'fixtures', 'CD_sample.cpp') }

  before do
    mock_omniauth!
    login
    visit problem_path(problem)
    click_link I18n.t('problems.show.add_solution')
  end

  scenario 'adding a new solution' do
    fill_in 'solution_explanation', with: 'Using BFS we can get the smallest path.'
    attach_file('solution_source_code', path)
    click_button I18n.t('helpers.submit.create', model: Solution)
    expect(current_path).to eql(problem_path(problem))
    expect(page).to have_content(I18n.t('problems.show.solution').pluralize(1))
  end

  scenario 'editing an existing solution' do
    create_solution(problem)
    visit problem_path(problem)
    click_link I18n.t('solutions.solution.edit')

    fill_in 'solution_explanation', with: 'The new description'
    click_button I18n.t('helpers.submit.update', model: Solution)
    expect(current_path).to eql(problem_path(problem))
    expect(page).to have_content('The new description')
  end

  scenario 'there is no edit link for solutions I cannot edit' do
    create(:solution, problem: problem)
    visit problem_path(problem)
    expect(page).not_to have_content(I18n.t('solutions.solution.edit'))
  end
end
