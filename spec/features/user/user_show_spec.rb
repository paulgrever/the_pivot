require "rails_helper"

RSpec.describe "the user show page", type: :feature do
  context "before logging in" do
    before :each do
      @user = create(:user)
    end

    xit "cannot access the page unless loged in" do
      visit items_path
      visit user_path(@user)
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are not
        authorized to access this page.")
    end

    it "is valid if user is authenticated" do
      login(@user)
      visit user_path(@user)
      expect(page).to have_content("Default user")
    end
  end

  context "after logging in"do
    before :each do
      @user = create(:user)
      login(@user)
      item = create(:item)
      order = create(:order, user_id: @user.id)
      create(:order_item,
             item_id: item.id,
             order_id: order.id)
      visit user_path(@user)
    end

    it "displays a user's recent order" do
      expect(page).to have_content("Water bottle")
    end

    it "has a link to send an email" do
      expect(page).to have_link("default.user@mail.com")
    end

    it "can edit their personal info" do
      click_link_or_button("Edit Info")
      expect(current_path).to eq(edit_user_path(@user))
      within("#edit-personal-info") do
        fill_in("user[email]", with: "test@example.com")
        click_link_or_button("update personal information")
      end
      expect(page).to have_link("test@example.com")
      expect(page).to have_content("Your information has been updated")
    end

    it "can edit their account info" do
      click_link_or_button("Edit Info")
      expect(current_path).to eq(edit_user_path(@user))
      fill_in("user[shipping_address]", with: "Madison WI")
      fill_in("user[billing_address]", with: "Denver CO")
      fill_in("user[credit_card]", with: "987654321")
      click_link_or_button("update account information")
      expect(page).to have_content("Your information has been updated")
    end
  end
end
