class ChangeColumnPriceInItemsToInteger < ActiveRecord::Migration
  def change
    remove_column :items, :price
    add_column :items, :price, :integer
  end
end
