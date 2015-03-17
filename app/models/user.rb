class User < ActiveRecord::Base
  validates :full_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :display_name, length: { maximum: 32, minimum: 2}, presence: false
  has_secure_password
  has_many :orders
  has_many :order_items, through: :orders
  has_many :items, through: :order_items
  enum role: %w(default admin)
end
