require "rails_helper"

describe "the admin item view", type: :feature do
  before :each do
    @item_status = FactoryGirl.create(:item_status)
    @item = FactoryGirl.create(:item, item_status_id: @item_status.id)
    admin = FactoryGirl.create(:admin)
    @category = FactoryGirl.create(:category)
    visit root_path
    within("#signInModal") do
      fill_in("session_email", with: admin.email)
      fill_in("session_password", with: admin.password)
      click_button "Sign in"
    end
    visit admin_items_path
  end

  it "displays all the items on the index page" do
    expect(page).to have_content(@item.title)
  end

  it "displays the description of the individual item on the show page" do
    click_link_or_button(@item.title)
    expect(current_path).to eq(admin_item_path(@item))
    expect(page).to have_content(@item.description)
  end

  it "can create a new item" do
    click_link_or_button("Create Item")
    fill_in("item[title]", with: "Racoon Ragu")
    fill_in("item[description]", with: "A bandit of a meal")
    fill_in("item[price_in_dollars]", with: 5.34)
    click_link_or_button("Create Item")
    expect(page).to have_content("Racoon Ragu")
    expect(current_path).to eq(admin_items_path)
  end

  it "can update the item" do
    visit(admin_item_path(@item))
    click_link_or_button("Edit")
    fill_in("item[title]", with: "Racoon Ragu")
    fill_in("item[description]", with: "A bandit of a meal")
    fill_in("item[price_in_dollars]", with: 5.34)
    find(:css, "#category_ids_[value='#{@category.id}']").set(true)
    click_link_or_button("Update Item")
    expect(page).to have_content("Racoon Ragu")
    expect(current_path). to eq(admin_item_path(@item))
  end

  it "can delete an item" do
    expect(Item.count).to eq(1)
    visit admin_item_path(@item)
    click_link_or_button("Delete")
    expect(Item.count).to eq(0)
  end

end
