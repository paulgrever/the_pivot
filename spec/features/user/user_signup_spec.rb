require "rails_helper"

RSpec.describe "user" do
  before :each do
    visit root_path
  end

  it "can sign up with a name, email, and password" do
    click_link_or_button("Sign up")
    expect(current_path).to eq(new_user_path)
    fill_in("name", with: "Paul")
    fill_in("email", with: "test@example.com")
    fill_in("password", with: "test")
    click_button("Register")
    expect(User.count).to eq(1)
    expect(current_path).to eq(user_path(User.find(1)))
  end

  xit "can't sign up with an invalid email" do
    click_link_or_button("Sign up")
    expect(current_path).to eq(new_user_path)
    fill_in("name", with: "Paul")
    fill_in("email", with: "hi")
    fill_in("password", with: "test")
    click_button("Register")
    expect(User.count).to eq(0)
    expect(page).to have_content("Input is invalid, please try again")
    expect(current_path).to eq(users_path)
  end

  it "can't sign up without a full name" do
    click_link_or_button("Sign up")
    expect(current_path).to eq(new_user_path)
    fill_in("name", with: "")
    fill_in("email", with: "test@example.com")
    fill_in("password", with: "test")
    click_button("Register")
    expect(User.count).to eq(0)
    expect(page).to have_content("Input is invalid, please try again")
    expect(current_path).to eq(users_path)
  end

  it "can't sign up without a passowrd" do
    click_link_or_button("Sign up")
    expect(current_path).to eq(new_user_path)
    fill_in("name", with: "Paul")
    fill_in("email", with: "test@example.com")
    fill_in("password", with: "")
    click_button("Register")
    expect(User.count).to eq(0)
    expect(page).to have_content("Input is invalid, please try again")
    expect(current_path).to eq(users_path)
  end
end
