class Business < ActiveRecord::Base
  belongs_to :user
  has_many :business_orders
  has_many :orders, through: :business_orders
  validates :name, :slug, uniqueness: true
  validates :user, presence: true
  has_many :items
  before_validation :generate_slug
  scope :pending, -> { where(status: "pending") }

  def generate_slug
    self.slug = name.parameterize
  end
end
