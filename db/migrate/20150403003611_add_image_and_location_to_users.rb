class AddImageAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, :default => "default_user_image.png"
    add_column :users, :location, :string, :default => "Denver, CO"
  end
end
