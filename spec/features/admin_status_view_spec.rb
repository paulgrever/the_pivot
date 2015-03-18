require 'rails_helper'

RSpec.describe "the admin status view", type: :feature do
  before :each do
    @order = FactoryGirl.create(:order)
    admin = FactoryGirl.create(:admin)
    visit login_path
    fill_in("session_email", with: admin.email)
    fill_in("session_password", with: admin.password)
    click_button 'Sign in'
  end

  it "displays the total number of orders" do
    admin = FactoryGirl.create(:admin)
    order = FactoryGirl.create(:order)
    order2 = FactoryGirl.create(:order)
    expect(Order.count).to eq(3)
  end

  it "displays the state of an order" do
    admin = FactoryGirl.create(:admin)
    order = FactoryGirl.create(:order, status_id: 4)
    status = FactoryGirl.create(:status, id: 4)
    expect(order.status.state).to eq("Ordered")
  end
end
