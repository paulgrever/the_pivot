class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  belongs_to :business
  belongs_to :item_status
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :order_items
  has_many :orders, through: :order_items

  scope :active, -> { where(item_status_id: 1) }
  has_attached_file :image, styles: { large: "500x340>", medium: "250x170>", thumb: "100x100>" }, default_url: "supply_default.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def price_in_dollars
    if price.nil?
      price
    else
      price/100.to_f
    end
  end

  def revenue
    order_items.inject(0) { |sum, order_item| sum + order_item.item_subtotal }
  end

  def units_sold
    order_items.inject(0) { |sum, order_item| sum + order_item.quantity }
  end

  def item_of_biz
    Item.where(business_id: business_id)
  end
end
