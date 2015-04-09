class Admin::DashboardController < ApplicationController
  def index
    @businesses = Business.where(status: "pending")
  end
end
