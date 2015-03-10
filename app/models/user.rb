class User < ActiveRecord::Base
  validates :full_name, presence: true
  has_secure_password
  has_many :orders
  has_many :order_items
  has_many :items, through: :order_items

  enum role: %w(default admin)
end
