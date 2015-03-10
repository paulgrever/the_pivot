require 'rails_helper'

describe "the item view", type: :feature do
  let(:item) do 
    Item.create(title: "Possum Stew", description: "Savory stew made with fresh possum", image: "www.possum.com", item_status_id: 1, price: 2.35)
  end

  it "displays all the items on the index page" do
    item
    visit items_path
    expect(page).to have_content("Possum Stew")    
  end

  it "displays the description of the individual item on the show page" do
    item
    visit items_path
    click_link_or_button("Possum Stew")
    expect(current_path).to eq(item_path(item))
    expect(page).to have_content("Savory stew made with fresh possum")
  end

  it "can create a new item" do
    visit items_path
    click_link_or_button("Create Item")
    fill_in('item[title]', with: "Racoon Ragu" )
    fill_in('item[description]', with: "A bandit of a meal" )
    fill_in('item[price]', with: 5.34)    
    click_link_or_button("Create Item")
    expect(page).to have_content("Racoon Ragu")
    expect(current_path).to eq(items_path)
  end





end