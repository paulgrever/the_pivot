require 'rails_helper'

RSpec.describe "the admins order view", type: :feature do
  before :each do
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
    @status = FactoryGirl.create(:status)
    @order = FactoryGirl.create(:order, user_id: @user.id, status_id: @status.id)
    # @order2 = FactoryGirl.create(:order, status: @status)
    visit login_path
    fill_in("session_email", with: @admin.email)
    fill_in("session_password", with: @admin.password)
    click_button 'Sign in'
    click_link_or_button "Customer Orders"
    # visit admin_orders_path
    # save_and_open_page
  end

  it "displays all the orders on the admin orders index page" do
    expect(page).to have_content("Admin Orders")
  end

  xit "displays button links for each individual order if there are orders" do
    expect(page).to has_button?("Details")
  end

  xit "shows each orders indivdual information" do
    within('table tr:nth-child(2)') do
      click_link_or_button("click here")
    end
      expect(page).to have_content("Details for Order ID:")
  end

  xit "displays the order status" do
    expect(page).to have_content("Status")
  end

  xit "displays order date and time" do
   within('table tr:nth-child(2)') do
      click_link_or_button( 'click here')
    end
  end

end
