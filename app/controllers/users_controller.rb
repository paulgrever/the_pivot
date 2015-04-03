class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.full_name} has been created"
      session[:user_id] = @user.id
      redirect_to(:back)
    else
      flash[:danger] = "Input is invalid, please try again"
      render(:new)
      
    end

  end

  def show
    @user = User.find(params[:id])
    authorize! :view, @user
  end

  private
  def user_params
    params.require(:user).permit(:email,
                                 :full_name,
                                 :username,
                                 :password,
                                 :provider,
                                 :image,
                                 :location,
                                 :uid)
  end
end
