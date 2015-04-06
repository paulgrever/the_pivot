class User::BusinessesController < ApplicationController

  def edit
    @business = Business.find(params[:id])
    authorize! :edit, @business
  end

  def update
    business = Business.find(params[:id])
    authorize! :update, @business
    business.update(business_params)
    redirect_to business_path(business)
  end

  def create    #corresponding new action is in BusinessController
    @business = Business.create!(business_params)
    authorize! :create, @business
    redirect_to business_path(@business.id), notice: "Your shiny new business is pending approval"
  end

  private

  def business_params
    params.require(:business).permit(:name, :description, :status, :user)
  end
end
