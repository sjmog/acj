require 'rails_helper'

Capybara.feature 'Viewing tasks' do
  context 'as an authed user' do
    before do
      coach = FactoryBot.create(:coach)
      login_as(coach)
    end

    scenario 'I can view tasks' do
      visit tasks_path
      expect(page).to have_content 'Tasks'
    end

    scenario 'I can make new tasks' do
      visit new_task_path
      fill_in(:'task[name]', with: "New Task")
      click_button 'Create Task'

      expect(page).to have_content 'New Task'
    end
  end

  context 'as a non-authed user' do
    scenario 'I cannot see tasks' do
      visit tasks_path

      expect(current_path).to eq new_coach_session_path
    end

    scenario 'I cannot make new tasks' do
      visit new_task_path

      expect(current_path).to eq new_coach_session_path
    end
  end
end