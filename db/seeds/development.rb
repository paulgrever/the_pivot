class Seed
  def call
    generate_users
    generate_item_statuses
    generate_active_items
    generate_retired_items
    generate_categories
    add_categories_to_items
    generate_order_statuses
    generate_orders
    generate_businesses
    create_orders_with_items
  end

  def generate_users
    User.create(email: 'test@gmail.com',
                full_name: "test_user",
                display_name: "test_user",
                password: "test",
                role: 0)

    User.create(email: 'admin@gmail.com',
                full_name: "admin_user",
                display_name: "admin_user",
                password: "test",
                role: 1)
  end

  def generate_active_items
    10.times do
      item = Item.create(title: Faker::Commerce.product_name,
                         description: Faker::Hacker.say_something_smart,
                         price: Faker::Number.number(4),
                         item_status_id: 1)
      puts "Created Active Item: #{item.title}"
    end
  end

  def generate_businesses
    10.times do
      random_user = User.all.sample
      business = Business.create(name: Faker::Company.name,
                                 description: Faker::Company.bs,
                                 user_id: random_user.id)
      puts "Created Business: #{business.name}"
    end
  end

  def generate_retired_items
    5.times do
      item = Item.create(title: Faker::Commerce.product_name,
                         description: Faker::Hacker.say_something_smart,
                         price: Faker::Number.number(4),
                         item_status_id: 2)
      puts "Created Retired Item: #{item.title}"
    end
  end

  def generate_categories
    5.times do
      category = Category.create(name: Faker::Commerce.department)
      puts "Created Category: #{category.name}"
    end
  end


  def add_categories_to_items
    30.times do
      selected_item = Item.all.sample
      selected_category = Category.all.sample
      ItemCategory.create(item_id: selected_item.id,
                          category_id: selected_category.id)
      puts "Added Category '#{selected_category.name}' for Item '#{selected_item.title}'"
    end
  end

  def generate_orders
    30.times do
      selected_user= User.all.sample
      random_status = [1, 2, 3, 4].sample
      Order.create(user_id: selected_user.id,
                   status_id: random_status,
                   created_at: Faker::Time.between(2.days.ago, Time.now),
                   updated_at: Faker::Time.between(2.days.ago, Time.now))
      puts "Create Order for: #{selected_user.full_name}"
    end
  end

  def create_orders_with_items
    70.times do |i|
      selected_item_id = Item.all.sample.id
      random_value = Order.all.sample.id
      OrderItem.create!(item_id: selected_item_id,
                        order_id: random_value,
                        quantity: (1..4).to_a.sample)
      puts "Created Order ##{i}"
    end
  end

  def generate_item_statuses
    ItemStatus.create(state: "Active")
    ItemStatus.create(state: "Retired")
  end

  def generate_order_statuses
    Status.create(state: "Ordered")
    Status.create(state: "Paid")
    Status.create(state: "Cancelled")
    Status.create(state: "Completed")
  end

  def self.call
    new.call
  end
end

Seed.call
