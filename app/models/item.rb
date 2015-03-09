class Item < ActiveRecord::Base
  validates  :description, :price, presence: true
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :price, numericality: { greater_than: 0}
end
