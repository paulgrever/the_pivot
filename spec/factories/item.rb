FactoryGirl.define do
  factory :item do
    title "Possum Stew"
    description "Savory stew made with fresh possum"
    image "http://cdn.attackofthecute.com/March-21-2012-01-40-38-fdghnfdgn.jpeg"
    item_status_id 1
    price 246
  end

  factory :item2, class: Item do
    title "Crab Cake"
    description "Savory stew made with fresh possum"
    image "http://cdn.attackofthecute.com/March-21-2012-01-40-38-fdghnfdgn.jpeg"
    item_status_id 1
    price 45
  end
end
