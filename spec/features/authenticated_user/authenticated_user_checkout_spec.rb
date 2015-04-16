require "rails_helper"

RSpec.describe "the authenticated user checkout", type: :feature do
  context "a user with account information" do
    before :each do
      user = create(:user,
                    shipping_address: "1510 Blake St",
                    billing_address: "2810 Center Ave", 
                    credit_card: "1234567890")
      login(user)
      create(:item)
      visit items_path
      click_on "Add to cart"
    end

    it "can checkout out successfully" do
      visit cart_items_path
      click_link_or_button "Checkout"
      expect(current_path).to eq(order_path(user))
    end

  end
end