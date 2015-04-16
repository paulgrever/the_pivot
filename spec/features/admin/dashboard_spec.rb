require "rails_helper"

describe "admin dashboard" do
  before :each do
    @admin = create(:admin)
    @admin.make_admin
    login(@admin)
  end

  context "authorization" do
    xit "only admins can see the admin dashboard" do
      user = create :user
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(user)
      visit admin_dashboard_path(user)
      expect(current_path).to eq(root_path)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(current_path).to eq(admin_dashboard_path(admin))
    end
  end

  context "new business approval" do
    before :each do
      business_owner = create(:business_owner)
      business_owner.make_business_owner
      @business = Business.create(name: "New business", user: business_owner)
    end

    it "displays requests" do
      visit admin_dashboard_path
      expect(page).to have_content(@business.name)
    end

    xit "approve request" do
      visit admin_dashboard_path
      expect(page).to have_content(@business.name)
      click_link_or_button("Approve")
      expect(page).not_to have_content(@business.name)
    end

    xit "deny the new business request" do
      visit admin_dashboard_path
      expect(page).to have_content(@business.name)
      click_link_or_button("Deny")
      expect(page).to have_content("#{@business.name} has been removed!")
      expect(Business.count).to eq(0)
    end
  end
end
