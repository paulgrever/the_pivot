class Cart
  attr_accessor :data

  def initialize(input_data)
    @data = input_data || Hash.new
  end

  def add_item(item_id)
    data[item_id.to_s] ||= 0
    data[item_id.to_s] += 1
  end

  def remove_item(item_id)
    data.delete(item_id.to_s)
  end

  def remove_one(item_id)
    data[item_id.to_s] -= 1
  end

  def count_of(item_id)
    data[item_id.to_s]
  end

  def count_total
    data.values.sum
  end

  def find_item(item_id)
    Item.find(item_id).title
  end

  def subtotal(item_id)
    (data[item_id] * Item.find(item_id).price_in_dollars).round(2)
  end

  def total
    data.keys.inject(0) { |sum, item_id| sum + subtotal(item_id) }.round(2)
  end

  def create_order_items(order)
    data.each do |item_id, qty|
      order.order_items.create(item_id: item_id, quantity: qty)
    end
  end
end
