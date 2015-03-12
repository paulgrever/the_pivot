require 'rails_helper'

RSpec.describe "the user authentication feature", type: :feature do
  context 'a valid user logs in' do
    before :each do
      @user = FactoryGirl.create(:user)
      visit login_path
      fill_in("session_email", with: @user.email)
      fill_in("session_password", with: @user.password)
      click_button 'Sign in'
    end

    it 'allows the user to log in' do
      expect(page).to have_content("Welcome, #{@user.full_name}.")
    end

    it 'allows the user to logout in' do
      click_link_or_button 'Sign out'
      expect(page).to have_content('You have successfully signed out.')
      expect(page).to have_content('Email')
    end
  end

  it 'prevents an invalid user from logging in' do
    visit login_path
    fill_in("session_email", with: 'paul@mail.com')
    fill_in("session_password", with: 'not paul')
    click_button "Sign in"
    expect(page).to have_content('Invalid login.')
  end
end
