require "rails_helper"

RSpec.describe "the user authorization feature", type: :feature do
  context "when a default user signs in" do
    before :each do
      user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(user)
      visit user_path(user)
    end

    it "allows a user to view his page" do
      expect(page).to have_content("Default user's profile")
    end

    it "prevents a user from viewing anothers profile" do
      other_user = FactoryGirl.create(:user,
                                      email: "jgu@jgu.com",
                                      password: "jgu")
      visit user_path(other_user)
      expect(page).to have_content("not authorized")
    end

    it "prevents a user from viewing the admin item index" do
      visit admin_items_path
      expect(page).to have_content("not authorized")
    end

    it "prevents a user from viewing the admin new item index" do
      visit new_admin_item_path
      expect(page).to have_content("not authorized")
    end

    it "prevents a user from viewing the admin edit item index" do
      item = FactoryGirl.create(:item)
      visit edit_admin_item_path(item)
      expect(page).to have_content("not authorized")
    end

    it "prevents a user from viewing the category index" do
      visit admin_categories_path
      expect(page).to have_content("not authorized")
    end

    it "prevents a user from viewing the new category page" do
      visit new_admin_category_path
      expect(page).to have_content("not authorized")
    end

    it "prevents a user from viewing a category page" do
      category = FactoryGirl.create(:category)
      visit new_admin_category_path(category)
      expect(page).to have_content("not authorized")
    end

    it "prevents a user from viewing the orders dashboard" do
      visit admin_orders_path
      expect(page).to have_content("not authorized")
    end
  end

  context "when an admin signs in" do
    before :each do
      admin = FactoryGirl.create(:admin)
      visit root_path
      within("#signInModal") do
        fill_in("session_email", with: admin.email)
        fill_in("session_password", with: admin.password)
        click_button "Sign in"
      end
    end

    it "allows admins to view the orders dashboard" do
      visit admin_orders_path
      expect(page).to have_content("Orders")
    end
  end
end
