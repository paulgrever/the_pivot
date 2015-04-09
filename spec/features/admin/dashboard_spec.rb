require "rails_helper"

describe "admin dashboard" do
  context "new business approval" do
    # let(:user) { create :user }
    let(:admin) { create :admin }
    let(:pending_business) { create :pending_business }

    it "displays requests" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(page).to have_content("new business name")
    end
  end
end
