require 'rails_helper'

RSpec.describe "the user authorization feature", type: :feature do
  let(:valid_user) { User.create(email: "paul@mail.com", full_name: 'Paul', password: "paul") }
  let(:other_user) { User.create(email: "lori@mail.com", full_name: 'Lori', password: "lori") }
  let(:admin) { User.create(email: "admin_man@mail.com", full_name: 'AdminMan', password: "admin", role: 'admin') }

  it 'allows an authorized user to view his page' do
    valid_user
    visit login_path
    fill_in("session_email", with: 'paul@mail.com')
    fill_in("session_password", with: 'paul')
    click_link_or_button 'Sign in'
    expect(page).to have_content('Paul\'s profile')
  end

  it 'prevents a user from viewing anothers profile' do
    other_user
    visit login_path
    fill_in("session_email", with: 'lori@mail.com')
    fill_in("session_password", with: 'lori')
    click_link_or_button "Sign in"
    visit user_path(valid_user)
    expect(page).to have_content('You are not authorized to access this page.')
  end

  xit 'allows admins to view other profiles' do
    admin
    visit login_path
    fill_in("session_email", with: 'admin_man@mail.com')
    fill_in("session_password", with: 'admin')
    click_link_or_button 'Sign in'
    expect(page).to have_content('AdminMan\'s profile')
  end
end
