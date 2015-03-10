class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
