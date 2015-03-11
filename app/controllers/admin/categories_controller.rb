class Admin::CategoriesController < AdminController
  
  def index
    @categories = Category.all
  end
end