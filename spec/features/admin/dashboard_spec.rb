require "rails_helper"

describe "admin dashboard" do
  context "new business approval" do
    let!(:admin) { create :admin }

    it "displays requests" do
      create :business
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(page).to have_content("Water merchant")
    end

    it 'approve request' do
      create :business
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(page).to have_content("Water merchant")
      click_link_or_button("Approve")
      expect(page).not_to have_content("Water merchant")
    end
  end
end
