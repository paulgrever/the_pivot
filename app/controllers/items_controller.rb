class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
    @items = Item.active
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
