require "rails_helper"
OmniAuth.config.test_mode = true

RSpec.describe "the user authentication feature", type: :feature do
  context "when given correct credentials" do
    before :each do
      @user = FactoryGirl.create(:user)
      visit login_path
      fill_in("session_email", with: @user.email)
      fill_in("session_password", with: @user.password)
      click_button "Sign in"
    end

    it "allows the user to log in" do
      expect(page).to have_content("Welcome, #{@user.full_name}.")
    end

    it "allows the user to logout in" do
      click_link_or_button "Sign out"
      expect(page).to have_content("You have successfully signed out.")
    end
  end

  it "prevents an invalid user from logging in" do
    visit login_path
    fill_in("session_email", with: "paul@mail.com")
    fill_in("session_password", with: "not paul")
    click_button "Sign in"
    expect(page).to have_content("Invalid login.")
  end

  context "when used through Twitter" do
    it "allows the user to log in" do
      visit login_path
      expect(page).to have_content("Sign in with Twitter")
      user = OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        'provider' => 'twitter',
        'uid' => '123545',
        'info' => {
          'name' => 'mockuser',
          'image' => 'mock_user_thumbnail_url'
        },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      })
      within(".button_to") do
        click_link_or_button "Twitter"
      end
      expect(page).to have_content("Welcome, #{user.info.name}.")
    end

    it "can handle authentication error" do
      OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
      visit login_path
      expect(page).to have_content("Sign in with Twitter")
      within(".button_to") do
        click_link_or_button "Twitter"
      end
      expect(page).to have_content("Authentication failed")
    end
  end
end
