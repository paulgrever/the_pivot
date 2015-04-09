class Business < ActiveRecord::Base
  belongs_to :user

  validates :name, :slug, uniqueness: true

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
