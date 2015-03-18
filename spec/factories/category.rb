FactoryGirl.define do
  factory :category do
    name "vegan"
  end

  factory :category2, class: Category do
    name "appetizer"
  end
end
