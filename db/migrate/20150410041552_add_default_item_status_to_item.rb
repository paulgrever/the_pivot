class AddDefaultItemStatusToItem < ActiveRecord::Migration
  def change
    change_column :items, :item_status_id, :integer, default: 1
  end
end
