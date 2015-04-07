require 'rails_helper'

RSpec.describe "the admin status view", type: :feature do
  before :each do
    @order = FactoryGirl.create(:order)
    admin = FactoryGirl.create(:admin)
    visit root_path
    within("#signInModal") do
      fill_in("session_email", with: admin.email)
      fill_in("session_password", with: admin.password)
      click_button 'Sign in'
    end
  end

  it "displays the total number of orders" do
    FactoryGirl.create(:order)
    FactoryGirl.create(:order)
    expect(Order.count).to eq(3)
  end

  it "displays the state of an order" do
    order = FactoryGirl.create(:order, status_id: 4)
    FactoryGirl.create(:status, id: 4)
    expect(order.status.state).to eq("Ordered")
  end
end
