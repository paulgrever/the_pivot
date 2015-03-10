require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) do 
    Category.create(name: "vegan")
  end

  it "is valid with all parameters" do
    expect(category).to be_valid
  end

  it "is not valid with a name" do
    category.name = nil
    expect(category).to_not be_valid
  end

  it "is not valid if when submitted with same name but with a capital" do
    category
    Category.create(name: "Vegan")
    expect(Category.count).to eq(1)
  end

end
