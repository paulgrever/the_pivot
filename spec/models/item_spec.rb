require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) do 
    Item.create(title: "Possum Stew", description: "Savory stew made with fresh possum", image: "www.possum.com", item_status_id: 1, price: 2.35)
  end

  it "is valid when all parameters are given" do
    expect(item).to be_valid
    expect(Item.count).to eq(1)
  end

  it "is invalid without a title" do
    item.title = nil
    expect(item).to_not be_valid    
  end

  it "is invalid without a description" do
    item.description = nil
    expect(item).to_not be_valid  
  end

  it "is invalid with a price" do
    item.price = nil
    expect(item).to_not be_valid  
  end

  it "is invalid with an empty string for title" do
    item.title = ""
    expect(item).to_not be_valid 
  end

  it "is invalid with an empty string for description" do
    item.description = ""
    expect(item).to_not be_valid 
  end
  
  it "is invalid with duplicate titles" do
    item
    item2 = Item.new(title: "Possum Stew", description: "Savory stew made with fresh possum", image: "www.possum.com", item_status_id: 1, price: 2.35)
    expect(item2).to_not be_valid 
  end

  it "is invalid with duplicate titles in difference case" do
    item
    item2 = Item.new(title: "possum stew", description: "Savory stew made with fresh possum", image: "www.possum.com", item_status_id: 1, price: 2.35)
    expect(item2).to_not be_valid 
  end

  it "is invalid with a price less than 0" do
    item.price = -1
    expect(item).to_not  be_valid
  end



end
