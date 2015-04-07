require "rails_helper"

RSpec.describe "user" do
  before :each do
    visit root_path
  end

  it "can sign up with a name, email, and password" do
    within("#signUpModal") do
      click_link_or_button("Sign up")
      fill_in("name", with: "Paul")
      fill_in("email", with: "test@example.com")
      fill_in("password", with: "test")
      click_button("Sign up")
    end
    expect(User.count).to eq(1)
    expect(current_path).to eq(user_path(User.find(1)))
  end

  it "can't sign up with an invalid email" do
    within("#signUpModal") do
      click_link_or_button("Sign up")
      fill_in("name", with: "Paul")
      fill_in("email", with: "hi")
      fill_in("password", with: "test")
      click_button("Sign up")
    end
    expect(User.count).to eq(0)
    expect(page).to have_content("Input is invalid, please try again")
    expect(current_path).to eq(users_path)
  end

  it "can't sign up without a full name" do
    within("#signUpModal") do
      click_link_or_button("Sign up")
      fill_in("name", with: "")
      fill_in("email", with: "test@example.com")
      fill_in("password", with: "test")
      click_button("Sign up")
    end
    expect(User.count).to eq(0)
    expect(page).to have_content("Input is invalid, please try again")
    expect(current_path).to eq(users_path)
  end

  it "can't sign up without a passowrd" do
    within("#signUpModal") do
      click_link_or_button("Sign up")
      fill_in("name", with: "Paul")
      fill_in("email", with: "test@example.com")
      fill_in("password", with: "")
      click_button("Sign up")
    end
    expect(User.count).to eq(0)
    expect(page).to have_content("Input is invalid, please try again")
    expect(current_path).to eq(users_path)
  end
end
