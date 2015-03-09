class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new(title: params[:title], description: params[:description], price: params[:price], item_status_id: 1, image: params[:image])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new 
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :image, :price, :item_status_id)
  end
end
