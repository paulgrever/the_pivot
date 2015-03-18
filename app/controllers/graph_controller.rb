class GraphController < ApplicationController
  def index
  end

  def data_revenue
    revenue_data = {}
    items = Item.all
    item_titles = Item.pluck(:title)
    item_revenues = items.map(&:revenue)
    item_revenues, item_titles = item_revenues.zip(item_titles).sort.transpose
    revenue_data[:item] = item_titles
    revenue_data[:numbers] = item_revenues
    deliver_json(revenue_data)
  end

  def data_units
    unit_data = {}
    items = Item.all
    item_titles = Item.pluck(:title)
    item_units = items.map(&:units_sold)
    item_units, item_titles = item_units.zip(item_titles).sort.transpose
    unit_data[:item] = item_titles
    unit_data[:numbers] = item_units
    deliver_json(unit_data)
  end

  def deliver_json(hash)
    respond_to do |format|
      format.json {
        render json: hash.to_json
      }
    end
  end
end
