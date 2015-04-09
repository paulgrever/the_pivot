require "rails_helper"

describe "admin dashboard" do
  context "new business approval" do
    let(:admin) { create :admin }
    let!(:pending_business) { create :business }

    it "displays requests" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(page).to have_content("Water merchant")
    end
  end
end
