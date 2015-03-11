class OrdersController < ApplicationController
  def index
    @orders = current_user.orders 
    authorize! :view, Order
  end

  def show
    @order = Order.find(params[:id])
    authorize! :view, @order
  end
end
