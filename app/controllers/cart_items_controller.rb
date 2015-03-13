class CartItemsController < ApplicationController
  def index
  end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item)
    session[:cart] = @cart.data
    flash[:success] = "Item added to your net."
    redirect_to :back
  end
end
