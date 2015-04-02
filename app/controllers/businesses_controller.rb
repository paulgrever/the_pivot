class BusinessesController < ApplicationController
  def show
    @business = Business.first
    @items = ["250x300", "300x300", "200x200", "200x300"]
  end
end
