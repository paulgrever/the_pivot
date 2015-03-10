class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :category_id
      t.string :image
      t.integer :item_status_id
      t.decimal :price
    end
  end
end

