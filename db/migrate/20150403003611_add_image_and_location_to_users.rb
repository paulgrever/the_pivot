class AddImageAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, :default => "Denver, CO"
    add_column :users, :location, :string, :default => "default_user_image.png"
  end
end
