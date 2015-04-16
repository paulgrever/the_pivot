class Admin::DashboardController < AdminController
  def show
    @businesses = Business.pending
    @categories = Category.all
  end
end
