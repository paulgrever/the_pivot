class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_user, except: :create

  def create
    @user = User.new(user_params)
    if @user.save
      @user.sign_up_via_email?
      flash[:notice] = "#{@user.full_name} has been created"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "Input is invalid, please try again"
      render(:new)
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your information has been updated"
      redirect_to user_path(@user)
    else
      flash[:danger] = "#{@user.errors.full_messages.each { |m| m } }"
      render(:edit)
    end
  end

  def show
  end

  private

  def authorize_user
    if current_user.nil?
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,
                                 :full_name,
                                 :username,
                                 :password,
                                 :provider,
                                 :image,
                                 :location,
                                 :uid,
                                 :shipping_address,
                                 :billing_address,
                                 :credit_card)
  end
end
