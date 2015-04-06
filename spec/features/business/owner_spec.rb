require "rails_helper"

describe "business" do
  context "owner" do
    it "can create an new business" do
      user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(user)
      visit new_business_path
      fill_in "Name", with: "new business name"
      fill_in "Description", with: "business discription"
      click_button "Create Business"
      save_and_open_page
      expect(Business.count).to eq 1
    end

    it "can update title and description" do
      business_owner = FactoryGirl.create(:business_owner)
      business = FactoryGirl.create(:business, user: business_owner)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(business_owner)
      visit edit_user_business_path(business.id)
      fill_in "Description", with: "new description"
      click_link_or_button "Update Business"
    end
  end

  context "unauthorized" do
    it "guest user can not view business edit" do
      user = FactoryGirl.create(:user)
      business_owner = FactoryGirl.create(:business_owner)
      business = FactoryGirl.create(:business, user: business_owner)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(user)
      visit edit_user_business_path(business.id)
      expect(current_path).to eq(items_path)
    end

    it "other business owners can not view business edit" do
      un_auth_business_owner = FactoryGirl.create(:business_owner)
      business_owner = FactoryGirl.create(:business_owner)
      business = FactoryGirl.create(:business, user: business_owner)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(un_auth_business_owner)
      visit edit_user_business_path(business.id)
      expect(current_path).to eq(items_path)
    end
  end
end
