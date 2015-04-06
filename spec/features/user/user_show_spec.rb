require "rails_helper"

RSpec.describe "the user show page", type: :feature do
  context "before logging in" do
    before  :each do 
      @user = FactoryGirl.create(:user)
    end

    it "cannot access the page unless loged in" do
      visit items_path
      visit user_path(@user)
      expect(current_path).to eq(items_path)
      expect(page).to have_content("You are not authorized to access this page.")
    end

    it "is valid if user is authenticated" do
      visit login_path
      fill_in("session_email", with: "paullorijgu@gmail.com")
      fill_in("session_password", with: "gu")
      click_button "Sign in"
      visit user_path(@user)
      expect(page).to have_content("Laul Guberson")
    end
  end

  context "after logging in"do
    before  :each do 
      @user = FactoryGirl.create(:user)
      item = FactoryGirl.create(:item)
      order = FactoryGirl.create(:order, user_id: @user.id)
      order_item = FactoryGirl.create(:order_item, item_id: item.id, order_id: order.id)
      order = FactoryGirl.create(:order, user_id: @user.id)
      visit login_path
      fill_in("session_email", with: "paullorijgu@gmail.com")
      fill_in("session_password", with: "gu")
      click_button "Sign in"
    end
  
    it "displays a user's recent order" do
      expect(page).to have_content("Possum Stew")  
    end

    it "has a link to send an email" do
      expect(page).to have_link("paullorijgu@gmail.com")  
    end
  end
end
