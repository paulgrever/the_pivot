require "rails_helper"

describe "Business" do
  context "can be requested by a logged in user" do
    before do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(user)
      visit user_path(user)
      click_link "Create a business"
      fill_in "Name", with: "new business name"
      fill_in "Description", with: "business discription"
      click_button "Create Business"
    end
    it { expect(Business.count).to eq 1 }
    let(:business) { Business.first }
    it { expect(business.status).to eq("pending") }
  end

  context "owner" do
    xit "can update title and description of existing business" do
      business_owner = create(:business_owner)
      business = Business.create!(user: business_owner, name: "New Water Merchant")

      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(business_owner)
      visit edit_business_path(business.id)
      fill_in "Description", with: "new description"
      click_link_or_button "Update Business"
      within(".jumbotron") do
        expect(page).to have_content("new description")
      end
    end

    xit "can only update their own businesses" do
      business_owner = create(:business_owner)
      Business.create!(user: business_owner, name: "New Water Merchant")
      other_business_owner = create(:business_owner2)
      other_business = create(:other_business, user: other_business_owner)

      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(business_owner)
      visit edit_business_path(other_business.id)
      expect(current_path).to eq(root_path)
    end

    it "can add new items to their businesses"
    it "can only edit items on their businesses"
  end
end
