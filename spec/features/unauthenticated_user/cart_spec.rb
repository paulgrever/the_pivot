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
    it "can add items from multiple businesses" do
      business = create(:business)
      other_business = create(:other_business)
      item1 = create(:item, business_id: business.id)
      item2 = create(:item2, business_id: other_business.id)
      visit items_path
      within "#item_#{item1.id}" do 
        click_on "Add to cart"
      end
      within("#cart") do
        expect(page).to have_content("1")
      end
      within("#item_#{item2.id}") do 
        click_on "Add to cart"
      end
      within("#cart") do
        expect(page).to have_content("2")
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
      within(".item") do
        click_on "Add to cart"
      end
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
      within("#subtotal") do
        expect(page).to have_content(2.00)
      end
      click_on "Remove all"
      expect(page).not_to have_content("Water bottle")
      expect(page).not_to have_content(2.00)
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
      within("#subtotal") do
        expect(page).to have_content(4.00)
      end
      click_on "-"
      within("#quantity") do
        expect(page).to have_content("1")
      end
      within("#subtotal") do
        expect(page).to have_content(2.00)
      end
      expect(page).to have_content("Item removed from your cart")
    end

    it "should be able to increase the quantity of an item" do
      create(:item)
      visit items_path
      click_on "Add to cart"
      visit cart_items_path

      within("#quantity") do
        expect(page).to have_content("1")
      end
      within("#subtotal") do
        expect(page).to have_content(2.00)
      end
      click_on "+"
      within("#quantity") do
        expect(page).to have_content("2")
      end
      within("#subtotal") do
        expect(page).to have_content(4.00)
      end
      expect(page).to have_content("Item added to your cart")
    end

    it "should not be able to checkout" do
      create(:item)
      visit items_path
      click_on "Add to cart"
      visit cart_items_path
      click_link_or_button("Checkout")
      expect(current_path).to eq(cart_items_path)
      expect(Order.count).to eq(0)
      expect(page).to have_content("Please login to checkout")
    end
  end
end
