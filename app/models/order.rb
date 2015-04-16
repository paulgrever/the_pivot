class Order < ActiveRecord::Base
  validates :user_id, :status_id, presence: true
  belongs_to :user
  belongs_to :status
  has_many :business_orders
  has_many :businesses, through: :business_orders
  has_many :order_items
  has_many :items, through: :order_items

  def date
    created_at.strftime("%m-%d-%Y")
  end

  def time
    created_at.strftime("%I:%M %p")
  end

  def order_status
    status.state
  end

  def order_total_cost
    order_items.inject(0) do |sum, order_item|
      sum + order_item.item_subtotal
    end
  end

  def user_full_name
    user.full_name
  end
end
