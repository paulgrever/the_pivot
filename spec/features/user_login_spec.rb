require 'rails_helper'

RSpec.describe "the user authentication feature", type: :feature do
  let(:valid_user) { User.create(email: "paul@mail.com", full_name: 'Paul', password: "paul") }

  context 'a valid user logs in' do
    before :each do
      valid_user
      visit login_path
      fill_in("session_email", with: 'paul@mail.com')
      fill_in("session_password", with: 'paul')
      click_link_or_button 'Sign in'
    end

    it 'allows the user to log in' do
      expect(page).to have_content('Welcome, Paul.')
    end

    it 'allows the user to logout in' do
      click_link_or_button 'Sign out'
      expect(page).to have_content('You have successfully signed out.')
      expect(page).to have_content('Sign in')
    end
  end

  it 'prevents an invalid user from logging in' do
    valid_user
    visit login_path
    fill_in("session_email", with: 'paul@mail.com')
    fill_in("session_password", with: 'not paul')
    click_link_or_button "Sign in"
    expect(page).to have_content('Invalid login.')
  end

end
