class Item < ActiveRecord::Base
  validates  :description, :price, presence: true
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :price, numericality: { greater_than: 0}
  belongs_to :item_status
  has_many :item_categories
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :categories, through: :item_categories

  def price_in_dollars
    if price.nil?
      price
    else
     price/100.to_f
    end
  end
end
