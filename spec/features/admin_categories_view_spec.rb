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

    it "can create a new cateogry" do
      click_link_or_button("New Category")
      fill_in("category[name]", with: "New Category")
      click_link_or_button("Create Category")
      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("New Category")
    end

    it "can edit a category" do
      within('#category_vegan') do 
        click_link_or_button("Edit")
      end
      fill_in("category[name]", with: "New Category")
      click_link_or_button('Update Category')
      expect(page).to have_content("New Category")
    end
    it "can delete a category" do
       within('#category_vegan') do 
        click_link_or_button("Delete")
      end
      expect(page).to_not have_content("vegan")
      expect(current_path).to eq(admin_categories_path)
    end
  end
end