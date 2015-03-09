class Item < ActiveRecord::Base
  validates :title, :description, :price, presence: true
end
