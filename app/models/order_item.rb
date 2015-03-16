class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  validates :quantity, presence: true

  def item_subtotal
    (quantity * item.price) / 100.to_f.round(2)
  end
end

 # (quantity * item.price) / 100.to_f.round(2)