FactoryGirl.define do
  factory :item do
    title "Possum Stew"
    description "Savory stew made with fresh possum"
    image_file_name "pretty_clams.jpg"
    image_content_type "image/jpeg"
    image_file_size 7359
    image_updated_at 2015
    item_status_id 1
    price 246
  end

  factory :item2, class: Item do
    title "Crab Cake"
    description "Savory stew made with fresh possum"
    image_content_type "image/jpeg"
    image_file_size 7359
    image_updated_at 2015
    item_status_id 1
    price 45
  end
end
