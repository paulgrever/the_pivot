require "rails_helper"
OmniAuth.config.test_mode = true
OmniAuth.config.logger = Rails.logger

RSpec.describe "Unauthenticated user", type: :feature do
  it "should be able to login using their email" do
    expect(User.count).to eq(0)
    user = create(:user)
    visit root_path
    within("#signInModal") do
      fill_in("session_email", with: user.email)
      fill_in("session_password", with: user.password)
      click_button "Sign in"
    end
    expect(User.count).to eq(1)
  end

  it "should be able to login using Twitter" do
    expect(User.count).to eq(0)
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      "provider" => "twitter",
      "uid" => "123545",
      "info" => {
        "name" => "mockuser",
        "image" => "mock_user_thumbnail_url"
      },
      "credentials" => {
        "token" => "mock_token",
        "secret" => "mock_secret"
      }
    )
    visit root_path
    within("#signInModal") do
      click_link_or_button "Sign in with Twitter"
    end
    expect(User.count).to eq(1)
  end

  it "should not be able to login with invalid credentials" do
    user = create(:user)
    visit root_path
    within("#signInModal") do
      fill_in("session_email", with: "wrong@email.com")
      fill_in("session_password", with: user.password)
      click_button "Sign in"
    end
    expect(page).to have_content("Invalid login")
  end

  it "can handle authentication error" do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    visit root_path
    within("#signInModal") do
      click_link_or_button "Sign in with Twitter"
    end
    expect(page).to have_content("Authentication failed")
  end

  it "should be able to sign up using their email" do
    expect(User.count).to eq(0)
    visit root_path
    within("#signUpModal") do
      fill_in("name", with: "Test user")
      fill_in("email", with: "test@example.com")
      fill_in("password", with: "test")
      click_on "Sign up"
    end
    expect(User.count).to eq(1)
  end

  it "should be able to sign up using Twitter" do
    expect(User.count).to eq(0)
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      "provider" => "twitter",
      "uid" => "123545",
      "info" => {
        "name" => "mockuser",
        "image" => "mock_user_thumbnail_url"
      },
      "credentials" => {
        "token" => "mock_token",
        "secret" => "mock_secret"
      }
    )
    visit root_path
    within("#signUpModal") do
      click_on "Sign up with Twitter"
    end
    expect(User.count).to eq(1)
  end

  it "should be able to logout" do
    user = create(:user)
    login(user)
    click_on "Sign out"
    expect(page).to have_content("You have successfully signed out")
  end
end
