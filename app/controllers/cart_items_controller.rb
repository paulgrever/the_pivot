class CartItemsController < ApplicationController
  def index
  end

  def create
    if params[:subtract]
      cart.remove_one(params[:item_id])
      session[:cart] = cart.data
      flash[:danger] = "Item removed from your net."
    else
      cart.add_item(params[:item_id])
      session[:cart] = cart.data
      flash[:success] = "Item added to your net."
    end
    redirect_to :back
  end

  def destroy
    cart.remove_item(params[:id])
    flash[:danger] = "Items removed from your net."
    redirect_to cart_items_path
  end

  def update
    cart.update_quantity(params[:data][:quantity])
  end
end
