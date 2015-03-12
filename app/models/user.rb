class User < ActiveRecord::Base
  validates :full_name, presence: true
  has_secure_password
  has_many :orders
  has_many :items
  enum role: %w(default admin)
end
