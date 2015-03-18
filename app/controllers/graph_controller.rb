class GraphController < ApplicationController
  def index
  end

  def data
    revenue_data = {}
    items = Item.all
    item_titles = Item.pluck(:title)
    item_revenues = items.map(&:revenue)
    item_revenues, item_titles = item_revenues.zip(item_titles).sort.transpose
    revenue_data[:item] = item_titles
    revenue_data[:numbers] = item_revenues
    respond_to do |format|
      format.json {
        render json: revenue_data.to_json
      }
    end
  end
end
