require "rails_helper"

describe "the cart view", type: :feature do
  context "when an authenticated user" do
    before :each do
      FactoryGirl.create(:status, id: 1)
      @item = FactoryGirl.create(:item)
      user = FactoryGirl.create(:user)
      visit root_path
      within("#signInModal") do
        fill_in("session_email", with: user.email)
        fill_in("session_password", with: user.password)
        click_button "Sign in"
      end
      visit items_path
      click_link_or_button "Add to cart"
      visit cart_items_path
    end

    it "can add to cart" do
      within "#cart" do
        expect(page).to have_content("1")
      end
    end

    it "displays subtotals of item in cart" do
      expect(page).to have_content(2.46)
    end

    it "can remove an item from the cart" do
      click_link_or_button "Remove all"
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
        click_link_or_button "Add to cart"
        visit cart_items_path
      end

      it "can add multiple items to the cart" do
        within "#cart" do
          expect(page).to have_content("2")
        end
      end

      it "displays increased subtotal when second item added to cart" do
        expect(page).to have_content(4.92)
      end

      it "displays the total value of the cart" do
        item_2 = FactoryGirl.create(:item, title: "Clam Stew", price: 350)
        visit items_path
        within("#net-button-#{item_2.id}") do
          click_link_or_button "Add to cart"
        end
        visit cart_items_path
        expect(page).to have_content(8.42)
      end
    end

    context "when a user checks out" do
      before :each do
        click_link_or_button("Checkout")
      end

      it "can create an order" do
        expect(current_path).to eq(order_path(Order.first))
      end

      it "creates an order when checking out" do
        expect(Order.count).to eq(1)
      end

      it "clears the cart after creating an order" do
        within "#cart" do
          expect(page).to have_content("0")
        end
      end
    end
  end

  context "when an unauthenticated user" do
    before :each do
      FactoryGirl.create(:status, id: 1)
      @item = FactoryGirl.create(:item)
      visit items_path
      click_link_or_button "Add to cart"
      visit cart_items_path
    end

    it "can add to cart" do
      within "#cart" do
        expect(page).to have_content("1")
      end
    end

    it "displays subtotals of item in cart" do
      expect(page).to have_content(2.46)
    end

    it "can remove an item from the cart" do
      click_link_or_button "Remove all"
      expect(page).not_to have_content(2.46)
    end

    it "can increment an item in the cart" do
      click_link_or_button "+"
      expect(page).to have_content(4.92)
    end

    it "cannot checkout" do
      click_link_or_button("Checkout")
      expect(current_path).to eq(cart_items_path)
      expect(Order.count).to eq(0)
      expect(page).to have_content("Please login to checkout")
    end
  end
end
