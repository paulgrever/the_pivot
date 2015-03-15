class AddDefaultOrderStatusToOrders < ActiveRecord::Migration
  def change
    change_column_default :orders, :status_id, 1
  end
end
