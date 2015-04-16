class CreateBusinessOrdersJoinTable < ActiveRecord::Migration
  def change
    create_table :business_orders do |t|
      t.integer :business_id
      t.integer :order_id
    end
  end
end
