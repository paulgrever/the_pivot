class AddBusinessIDtoItems < ActiveRecord::Migration
  def change
    add_column :items, :business_id, :integer
  end
end
