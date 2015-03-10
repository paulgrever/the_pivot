require 'rails_helper'

RSpec.describe "the user authentication feature", type: :feature do
  let(:valid_user) { User.create(email: "paul@mail.com", full_name: 'Paul', password: "paul") }

  it 'allows a valid user to log in' do
    valid_user
    visit login_path
    fill_in("session_email", with: 'paul@mail.com')
    fill_in("session_password", with: 'paul')
    click_link_or_button 'Sign in'
    expect(page).to have_content('Welcome, Paul.')
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
