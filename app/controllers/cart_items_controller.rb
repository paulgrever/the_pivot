class CartItemsController < ApplicationController
  def index
  end

  def show
  end

  def create
    if params[:subtract]
      cart.remove_one(params[:item_id])
      session[:cart] = cart.data
      flash[:danger] = "Item removed from your cart"
    else
      cart.add_item(params[:item_id])
      session[:cart] = cart.data
      flash[:success] = "Item added to your cart"
    end
    redirect_to :back
  end

  def destroy
    cart.remove_item(params[:id])
    flash[:danger] = "Items removed from your cart"
    redirect_to cart_items_path
  end

  def update
    cart.update_quantity(params[:data][:quantity])
  end
end
