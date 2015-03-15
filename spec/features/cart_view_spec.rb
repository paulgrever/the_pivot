require 'rails_helper'

describe "the cart view", type: :feature do
  context "when an authenticated user" do
    before :each do
      status = FactoryGirl.create(:status, id: 1)
      @item = FactoryGirl.create(:item)
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in("session_email", with: user.email)
      fill_in("session_password", with: user.password)
      click_button 'Sign in'
      visit items_path
      click_link_or_button "Add to net"
      visit cart_items_path
    end

    it "can add to cart" do
      expect(page).to have_content("Items in net: 1")
    end

    it "displays subtotals of item in cart" do
      expect(page).to have_content(2.46)
    end

    it "can remove an item from the cart" do
      click_link_or_button "Release from net"
      expect(page).not_to have_content(2.46)
    end

    it "can increment an item in the cart" do
      click_link_or_button "+"
      expect(page).to have_content(4.92)
    end

    it "can decrement an item in the cart" do
      click_link_or_button "+"
      click_link_or_button "-"
      expect(page).to have_content(2.46)
    end

    context "when additional items are added to cart" do
      before :each do
        visit items_path
        click_link_or_button "Add to net"
        visit cart_items_path
      end

      it "can add multiple items to the cart" do
        expect(page).to have_content("Items in net: 2")
      end

      it "displays increased subtotal when second item added to cart" do
        expect(page).to have_content(4.92)
      end

      it "displays the total value of the cart" do
        item_2 = FactoryGirl.create(:item, title: "Clam Stew", price: 350)
        visit items_path
        within("#net-button-#{item_2.id}") do
          click_link_or_button "Add to net"
        end
        visit cart_items_path
        expect(page).to have_content(8.42)
      end
    end
    it "can create an order" do
      click_link_or_button("Checkout")
      expect(current_path).to eq(order_path(Order.first)) 
    end

    it "creates an order when checking out" do
      click_link_or_button("Checkout")
      expect(Order.count).to eq(1)
    end
  end

  context "when an unauthenticated user" do
  end
end
