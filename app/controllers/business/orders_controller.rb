class Business::OrdersController < BusinessController
  helper OrdersHelper

  def index
    @orders = current_user.businesses.first.orders
    if @orders.count <= 0
      @ordered_orders   = @order.where(status_id: 1)
      @paid_orders      = @order.where(status_id: 2)
      @cancelled_orders = @order.where(status_id: 3)
      @completed_orders = @order.where(status_id: 4)
    end
  end
end
