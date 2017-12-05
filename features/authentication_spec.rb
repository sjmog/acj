require 'rails_helper'

Capybara.feature 'Authentication' do
  scenario 'I can sign up' do
    visit new_coach_registration_path
    fill_in(:'coach[email]', with: 'coach@makersacademy.com')
    fill_in(:'coach[password]', with: 'password123')
    fill_in(:'coach[password_confirmation]', with: 'password123')
    click_button 'Sign up'

    expect(page).to have_content 'coach@makersacademy.com'
  end

  scenario 'I can sign in' do
    visit new_coach_registration_path
    fill_in(:'coach[email]', with: 'coach@makersacademy.com')
    fill_in(:'coach[password]', with: 'password123')
    fill_in(:'coach[password_confirmation]', with: 'password123')
    click_button 'Sign up'
    click_link 'Sign out'

    visit new_coach_session_path
    fill_in(:'coach[email]', with: 'coach@makersacademy.com')
    fill_in(:'coach[password]', with: 'password123')
    click_button 'Log in'

    expect(page).to have_content 'coach@makersacademy.com'
  end
end