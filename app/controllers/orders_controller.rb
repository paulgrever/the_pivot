class OrdersController < ApplicationController
  def index
    @orders = current_user.orders 
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    if current_user
      order = Order.create(user_id: current_user.id)
      redirect_to order
    else
      flash[:danger] = "Please login to checkout"
      redirect_to cart_items_path
    end
  end
end
