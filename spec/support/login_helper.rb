def login(user)
  visit root_path
  within("#signInModal") do
    fill_in("session_email", with: user.email)
    fill_in("session_password", with: user.password)
    click_button "Sign in"
  end
end
