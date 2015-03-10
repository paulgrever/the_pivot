class CategoriesController < ApplicationController
  before_filter :redirect_unless_admin
  
  def index
    @categories = Category.all
  end

  private

  def redirect_unless_admin
    unless current_user.admin?
      flash[:access] = "This path is for Admin Only"
      redirect_to items_path
      end
    end

end
