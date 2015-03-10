# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Create Items
Item.create(title: "Possum Stew", description: " A savory Morsel of fur and broth", image: "http://cdn.attackofthecute.com/March-21-2012-01-40-38-fdghnfdgn.jpeg", item_status_id: 1, price: 4.50)
Item.create(title: "Racoon Ragu", description: " Juicy chunks of fresh racoon tossed in a red sauce", image: "http://upload.wikimedia.org/wikipedia/commons/c/cf/Curious_Raccoon.jpg", item_status_id: 2, price: 9.95)

#Create Users
User.create(email: 'test@gmail.com', full_name: "test_user", display_name: "test_user", password: "test", role: 0)
User.create(email: 'test1@gmail.com', full_name: "test_user1", display_name: "test_user1", password: "test", role: 0)
User.create(email: 'admin@gmail.com', full_name: "admin_user", display_name: "admin_user", password: "test", role: 1)

#Create Orders
Order.create(user_id: 1, status_id: 1)
Order.create(user_id: 1, status_id: 2)
Order.create(user_id: 2, status_id: 3)
 