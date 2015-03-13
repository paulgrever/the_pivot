class AddDefaultToItemImage < ActiveRecord::Migration
  def change
    change_column_default :items, :image, "clam_default.png"
  end
end
