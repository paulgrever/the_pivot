class Item < ActiveRecord::Base
  validates  :description, :price, presence: true
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :price, numericality: { greater_than: 0}
  has_many :item_categories
  has_many :categories, through: :item_categories
  belongs_to :item_status
end
