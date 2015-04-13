require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryGirl.create(:item) }

  let(:category_of_item1) { item.categories.create(name: "Pasta") }
  let(:category_of_item2) { item.categories.create(name: "Appetizer") }

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
    item2 = Item.new(title: "Water bottle", description: "Savory stew made with fresh possum", item_status_id: 1, price: 2.35)
    expect(item2).to_not be_valid
  end

  it "is invalid with duplicate titles in difference case" do
    item
    item2 = Item.new(title: "wATER BOTTLE", description: "Savory stew made with fresh possum", item_status_id: 1, price: 2.35)
    expect(item2).to_not be_valid
  end

  it "is invalid with a price less than 0" do
    item.price = -1
    expect(item).to_not  be_valid
  end

  it "has a category" do
    category_of_item1
    expect(item.categories.first.name).to eq("Pasta")
  end

  it "can have more than one category" do
    category_of_item1
    category_of_item2
    expect(item.categories.count).to eq(2)
  end

  it "has an item status from item_status table" do
    create(:item_status, id: 1)
    expect(item.item_status.state).to eq("Completed")
  end



end
