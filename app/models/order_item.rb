class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  validates :quantity, presence: true

  def item_subtotal
    (quantity * item.price) / 100.00      
  end
end
