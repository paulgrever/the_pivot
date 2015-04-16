require "rails_helper"

RSpec.describe "the authenticated user checkout", type: :feature do
  context "a user with account information" do
    it "can checkout" do
      business = create(:business)
      create(:item, business_id: business.id)
      create(:status)
      @user = create(:user,
                     shipping_address: "1510 Blake St",
                     billing_address: "2810 Center Ave",
                     credit_card: "1234567890")
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(@user)
      login(@user)
      visit items_path
      click_on "Add to cart"
      visit cart_items_path
      click_link_or_button "Checkout"
      expect(current_path).to eq(order_path(1))
    end
  end

  context "a user without account information" do
    it "cannot checkout" do
      business = create(:business)
      create(:item, business_id: business.id)
      create(:status)
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(@user)
      login(@user)
      visit items_path
      click_on "Add to cart"
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(@user)
      login(@user)
      visit items_path
      click_on "Add to cart"
      visit cart_items_path
      click_link_or_button "Checkout"
      expect(current_path).to eq(edit_user_path(@user))
    end
  end
end
