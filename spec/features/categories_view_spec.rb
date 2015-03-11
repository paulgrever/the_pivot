require 'rails_helper'

describe "the category view", type: :feature do

  context "as an admin" do
    before :each do
      @category = FactoryGirl.create(:category)
      @category2 = FactoryGirl.create(:category2)
      @admin = FactoryGirl.create(:admin)
      visit login_path
      fill_in("session_email", with: @admin.email)
      fill_in("session_password", with: @admin.password)
      click_button 'Sign in'
      visit admin_categories_path
    end

    it "can view a list of all available categories " do
      expect(page).to have_content("vegan")
      expect(page).to have_content("appetizer")
    end




  end

  context "as a non admin" do 
    before :each
  end


end