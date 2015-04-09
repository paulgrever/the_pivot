class AddSlugAndStatusToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :slug, :string
    add_column :businesses, :status, :string, default: "pending"
  end
end
