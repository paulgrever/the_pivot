class ItemStatus < ActiveRecord::Base
  validates :state, presence: true, uniqueness: true
  has_many :items
end
