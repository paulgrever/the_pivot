class Admin::DashboardController < ApplicationController
  def index
    @businesses = Business.where(status: "pending")
    @categories = Category.all
  end
end
