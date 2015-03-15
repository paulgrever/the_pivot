class OrdersController < ApplicationController
  def index
    @orders = current_user.orders 
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.create(user_id: current_user.id)
    redirect_to order
  end
end
