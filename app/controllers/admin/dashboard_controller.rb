class Admin::DashboardController < ApplicationController
  def show
    @businesses = Business.where(status: "pending")
    @categories = Category.all
  end
end
