class Admin::OrdersController < AdminController
  def index
    @statuses = Status.all
    @orders = params[:status_id] ? Status.find(params[:status_id]).orders : Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(status_id: [:status_id])
      redirect_to admin_orders_path(status_id: status.id)
    else
      redirect_to admin_orders_path
    end 
  end
end



