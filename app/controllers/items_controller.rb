class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
    @items = Item.all
  end

  def show
    # @item = Item.find(params[:id])
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

end
