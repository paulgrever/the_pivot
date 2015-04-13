class User::BusinessController < ApplicationController

  def create
   @business = Business.create(business_params)
    authorize! :create, @business
    redirect_to show_business_path(@business.slug),
      notice: "Your shiny new business is pending approval"
  end

  private

  def business_params
   params.require(:business).permit(:name, :description, :status, :user)
  end
end
