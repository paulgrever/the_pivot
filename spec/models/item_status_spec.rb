require 'rails_helper'

RSpec.describe ItemStatus, type: :model do
  before :each do
    @item_status = FactoryGirl.create(:item_status)
  end

  it "is valid" do
    expect(@item_status).to be_valid
  end

  it "is invalid with a state" do
    @item_status.state = nil
    expect(@item_status).to_not be_valid
  end

  it "is invalid with duplicate entries" do
    @item_status
    ItemStatus.create(state: "Completed")
    expect(ItemStatus.count).to eq(1)
  end
end
