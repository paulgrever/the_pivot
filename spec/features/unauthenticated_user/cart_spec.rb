require "rails_helper"

RSpec.describe "Unauthenticated user", type: :feature do
  context "when on the items index page" do
    it "should be able to add items to their cart" do
      create(:item)
      visit items_path
      within("#cart") do
        expect(page).to have_content("0")
      end
      click_on "Add to cart"
      within("#cart") do
        expect(page).to have_content("1")
      end
    end
  end

  context "when on an individual item page" do
    it "should be able to add the item to their cart" do
      item = create(:item)
      visit item_path(item.id)
      within("#cart") do
        expect(page).to have_content("0")
      end
      click_on "Add to cart"
      within("#cart") do
        expect(page).to have_content("1")
      end
    end
  end

  it "should be able to view their cart page" do
    visit cart_items_path
    expect(page).to have_content("Currently in your cart")
  end

  context "when on the cart page" do
    it "should be able to remove an item from their cart" do
      create(:item)
      visit items_path
      click_on "Add to cart"
      visit cart_items_path

      within("#cart-show") do
        expect(page).to have_content("Water bottle")
      end
      click_on "Remove all"
      expect(page).not_to have_content("Water bottle")
      expect(page).to have_content("Items removed from your cart")
    end

    it "should be able to reduce the quantity of an item" do
      create(:item)
      visit items_path
      click_on "Add to cart"
      click_on "Add to cart"
      visit cart_items_path

      within("#quantity") do
        expect(page).to have_content("2")
      end
      click_on "-"
      within("#quantity") do
        expect(page).to have_content("1")
      end
      expect(page).to have_content("Item removed from your cart")
    end
  end
end
