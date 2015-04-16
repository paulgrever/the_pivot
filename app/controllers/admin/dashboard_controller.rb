class Admin::DashboardController < AdminController
  def show
    @businesses = Business.where(status: "pending")
    @categories = Category.all
  end
end
