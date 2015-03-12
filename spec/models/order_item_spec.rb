require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before :each do
    @order_item = FactoryGirl.create(:order_item)
  end

  it 'should belong to an order' do
    expect(@order_item).to respond_to(:order)
  end

  it 'should belong to an item' do
    expect(@order_item).to respond_to(:item)
  end

  it 'should be invalid without a quantity' do
    @order_item.quantity = nil
    expect(@order_item).to be_invalid
  end
end
