require "rails_helper"

RSpec.describe "Unauthenticated user", type: :feature do
  it "should be able to visit the items page and see all available items" do
    item_1 = create(:item)
    item_2 = create(:item2)
    visit items_path
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)
  end

  context "when on the items index page" do
    it "should be able to filter by category" do
      item_1 = create(:item)
      item_2 = create(:item2)
      category_1 = Category.create(name: "water")
      category_2 = Category.create(name: "first aid kits")
      item_1.categories << category_1
      item_2.categories << category_2

      visit items_path
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      within("#item-filter") do
        click_link_or_button "water"
      end
      expect(page).not_to have_content(item_2.title)
    end

    it "should be able to filter by business"

    it "should be able to view an individual item's page" do
      item = create(:item)
      visit item_path(item.id)
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.price)
    end
  end
end
