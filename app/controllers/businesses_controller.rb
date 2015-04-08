class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id])
    @items = ["250x300", "300x300", "200x200", "200x300"]
  end

  def new  #corresponding create action is in Uesr::BusinessController
    @business = Business.new
  end
end
