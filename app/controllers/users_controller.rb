class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize! :view, @user
  end
end
