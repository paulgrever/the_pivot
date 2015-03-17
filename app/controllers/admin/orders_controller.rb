class Admin::OrdersController < AdminController
  def index
    @statuses = Status.all
    @orders = params[:status_id] ? Status.find(params[:status_id]).orders : Order.all

    # @orders = if params[:status_id]
    #   Status.find(params[:status_id]).orders
    # else 
    #   Order.all
    # end
  end

  def show
    @order = Order.find(params[:id])
  end
end



