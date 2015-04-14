class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
    @items = Item.active.paginate(page: params[:page]).per_page(28)
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
