class BusinessesController < ApplicationController
  def show
    @business = Business.first
    @items = [ "250x300", "500x300", "500x700", "500x200", "500x600" ]
  end
end
