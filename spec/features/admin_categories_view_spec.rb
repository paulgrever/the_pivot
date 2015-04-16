require "rails_helper"

describe "the category view", type: :feature do
  context "as an admin" do
    before :each do
      @category  = Category.create(name: "Food")
      @category2 = Category.create(name: "Water")
      @admin     = create(:admin)
      @admin.make_admin
      login(@admin)
      visit admin_categories_path
    end

    it "can view a list of all available categories " do
      expect(page).to have_content("Food")
      expect(page).to have_content("Water")
    end

    it "can create a new cateogry" do
      click_link_or_button("New Category")
      fill_in("category[name]", with: "New Category")
      click_link_or_button("Create Category")
      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("New Category")
    end

    it "can edit a category" do
      within("#category_Food") do
        click_link_or_button("Edit")
      end
      fill_in("category[name]", with: "New Category")
      click_link_or_button("Update Category")
      expect(page).to have_content("New Category")
    end

    it "can delete a category" do
      within("#category_Food") do
        click_link_or_button("Delete")
      end
      expect(page).to_not have_content("Food")
      expect(current_path).to eq(admin_categories_path)
    end
  end
end
