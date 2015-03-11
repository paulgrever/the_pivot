# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Item.create(title: Faker::Commerce.product_name,
              description: Faker::Lorem.paragraph,
              image: Faker::Avatar.image, 
              price: Faker::Commerce.price,
              item_status_id: 1)
end

5.times do
  Item.create(title: Faker::Commerce.product_name,
              description: Faker::Lorem.paragraph,
              image: Faker::Avatar.image, 
              price: Faker::Commerce.price,
              item_status_id: 2)
end

5.times do 
  Category.create(name:Faker::Commerce.department)
end

30.times do 
  selected_item = Item.all.sample
  selected_category = Category.all.sample
  ItemCategory.create(item_id: selected_item.id,
                      category_id: selected_category.id)
end

#Create Users
User.create(email: 'test@gmail.com', full_name: "test_user", display_name: "test_user", password: "test", role: 0)
User.create(email: 'test1@gmail.com', full_name: "test_user1", display_name: "test_user1", password: "test", role: 0)
User.create(email: 'admin@gmail.com', full_name: "admin_user", display_name: "admin_user", password: "test", role: 1)

#Create Orders
Order.create(user_id: 1, status_id: 1)
Order.create(user_id: 1, status_id: 2)
Order.create(user_id: 2, status_id: 3)

# Item Status 

ItemStatus.create(state: "Active")
ItemStatus.create(state: "Retired")
 