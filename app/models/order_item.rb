class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  validates :quantity, presence: true

  def item_subtotal
    quantity * item.price
  end


end

