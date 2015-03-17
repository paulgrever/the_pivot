require "rails_helper"

describe "category_items", type: :feature do
  before :each do
    @user = FactoryGirl.create(:user)
    @category1 = FactoryGirl.create(:category)
    @category2 = FactoryGirl.create(:category2)
    @item = FactoryGirl.create(:item)
    @item2 = FactoryGirl.create(:item2)
    @item.categories << @category1
    @item2.categories << @category2
    visit items_path
  end

  it "can view a link for each category" do
    expect(page).to have_link("vegan")
    expect(page).to have_link("appetizer")
  end

  context "clicking on a category" do
    before :each do
      click_link_or_button("vegan")
    end
  
    it "directs you to correct category page" do
      expect(current_path).to eq(category_path(@category1))
    end

    it "displays the corresponding item with the category" do
      expect(page).to have_content("Possum Stew")
    end
  end

  it "displays all items within category" do
    @item2.categories << @category1
    click_link_or_button("vegan")
    expect(page).to have_content("Crab Cake")
    expect(page).to have_content("Possum Stew")
  end

  it "displays items that belong to category" do
    click_link_or_button("appetizer")
    expect(page).to have_content("Crab Cake")
    expect(page).to_not have_content("Possum Stew")
  end
end
