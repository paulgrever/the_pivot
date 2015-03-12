class Order < ActiveRecord::Base
  validates :user_id, :status_id, presence: true
  belongs_to :user
  belongs_to :status
  has_many :order_items
  has_many :items, through: :order_items
end
