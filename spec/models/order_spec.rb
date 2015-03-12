require 'rails_helper'

RSpec.describe Order, type: :model do
  before :each do
    @order = FactoryGirl.create(:order)
  end

  it "is valid when all parameters are given" do
    expect(Order.count).to eq(1)
  end

  it "is invalid without a user_id" do
    @order.user_id = nil
    expect(@order).to_not be_valid
  end

  it "is invalid without a description" do
    @order.status_id = nil
    expect(@order).to_not be_valid
  end

  it "is invalid with an empty string for status_id" do
    @order.status_id = ""
    expect(@order).to_not be_valid
  end

  it "is invalid with an empty string for order_id" do
    @order.user_id = ""
    expect(@order).to_not be_valid
  end
end
