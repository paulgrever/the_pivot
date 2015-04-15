class BusinessController < ApplicationController
  def show
    @business = Business.find_by(slug: params[:slug])
    if @business.nil?
      render file: "#{Rails.root}/public/404",
             layout: false,
             status: :not_found
    else
      @items = @business.items
    end
  end

  def new
    @business = Business.new
  end

  def edit
    @business = Business.find(params[:id])
  end

  def create
    @business = current_user.businesses.create(business_params)
    redirect_to show_business_path(@business.slug),
                notice: "Your shiny new business is pending approval"
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    redirect_to show_business_path(@business.slug)
  end

  def destroy
    business = Business.find(params[:id])
    business.destroy
    redirect_to :back,
                 notice: "#{business.name} has been removed!"
  end

  def approve
    business = Business.find(params[:id])
    business.update(approval_params)
    redirect_to :back
  end

  private

  def business_params
    params.require(:business).permit(:name, :description, :status, :user_id)
  end

  def approval_params
    params.require(:business).permit(:status)
  end
end
