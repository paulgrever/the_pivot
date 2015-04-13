require "rails_helper"

describe "category_items", type: :feature do
  before :each do
    @user = create(:user)
    @category1 = Category.create(name: "Food")
    @category2 = Category.create(name: "First Aid")
    @item = create(:item)
    @item2 = create(:item2)
    @item.categories << @category1
    @item2.categories << @category2
    visit items_path
  end

  it "can view a link for each category" do
    expect(page).to have_link("Food")
    expect(page).to have_link("First Aid")
  end

  context "clicking on a category" do
    before :each do
      click_link_or_button("Food")
    end

    it "directs you to correct category page" do
      expect(current_path).to eq(category_path(@category1))
    end

    it "displays the corresponding item with the category" do
      expect(page).to have_content("Water bottle")
    end
  end
end
