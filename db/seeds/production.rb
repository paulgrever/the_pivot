User.create(email: 'test@gmail.com', full_name: "test_user", display_name: "test_user", password: "test", role: 0)
User.create(email: 'test1@gmail.com', full_name: "test_user1", display_name: "test_user1", password: "test", role: 0)
User.create(email: 'admin@gmail.com', full_name: "admin_user", display_name: "admin_user", password: "test", role: 1)

User.create(email: 'demo+rachel@jumpstartlab.com', full_name: "Rachel Warbelow", display_name: "", password: "password", role: 0)
User.create(email: 'demo+jeff@jumpstartlab.com', full_name: "Jeff Casimir", display_name: "j3", password: "password", role: 0)
User.create(email: 'demo+jorge@jumpstartlab.com', full_name: "Jorge Tellez", display_name: "novohispano", password: "password", role: 0)
User.create(email: 'demo+josh@jumpstartlab.com', full_name: "Josh Cheek", display_name: "josh", password: "password", role: 1)

ItemStatus.create(state: "Active")
ItemStatus.create(state: "Retired")

Order.create(user_id: 1, status_id: 1)
Order.create(user_id: 1, status_id: 2)
Order.create(user_id: 2, status_id: 3)

Status.create(state: "Ordered")
Status.create(state: "Paid")
Status.create(state: "Cancelled")
Status.create(state: "Completed")

OrderItem.create(item_id: 1, order_id:1, quantity: 2)

Item.create(title: "Clams", description: "Our most famous dish", price: 4532, item_status_id: 1)

Category.create(name: "Appetizer")
Category.create(name: "Cocktail")
Category.create(name: "Dessert")
Category.create(name: "Entree")
Category.create(name: "Salad")

ItemCategory.create(item_id: 1, category_id: 1)