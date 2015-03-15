require 'date'

class Order < ActiveRecord::Base
  validates :user_id, :status_id, presence: true
  belongs_to :user
  belongs_to :status
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
    order_items.inject(0) { |sum, order_item| sum + order_item.item_subtotal }
  end
end
