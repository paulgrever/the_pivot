class GraphController < ApplicationController
  def index
  end

  def data_revenue
    revenue_data = match_name_to(:revenue)
    render json: revenue_data.to_json
  end

  def data_units
    unit_data = match_name_to(:units_sold)
    render json: unit_data.to_json
  end

  def match_name_to(func)
    data = {}
    items = Item.all
    item_titles = Item.pluck(:title)
    item_numbers = items.map(&func)
    item_numbers, item_titles = item_numbers.zip(item_titles).sort.transpose
    data[:item] = item_titles
    data[:numbers] = item_numbers
    data
  end
end
