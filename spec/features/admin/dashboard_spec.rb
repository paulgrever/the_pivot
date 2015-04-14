require "rails_helper"

describe "admin dashboard" do
  let!(:admin) { create :admin }

  context "authorization" do
    xit 'only admins can see the admin dashboard' do
      user  = create :user
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
    let!(:business) { create :business }

    it "displays requests" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(page).to have_content("Water merchant")
    end

    it 'approve request' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(page).to have_content("Water merchant")
      click_link_or_button("Approve")
      expect(page).not_to have_content("Water merchant")
    end

    it 'deny the new business request' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(admin)
      visit admin_dashboard_path(admin)
      expect(page).to have_content("Water merchant")
      click_link_or_button("Deny")
      expect(page).not_to have_content("Water merchant")
      expect(Business.count).to eq(0)
    end
  end
end
