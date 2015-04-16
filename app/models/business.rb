class Business < ActiveRecord::Base
  belongs_to :user
  validates :name, :slug, uniqueness: true
  validates :user, presence: true
  has_many :items
  before_validation :generate_slug
  scope :pending, -> { where(status: "pending") }

  def generate_slug
    self.slug = name.parameterize
  end
end
