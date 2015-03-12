class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.full_name}."
    else
      flash[:danger] = 'Invalid login.'
    end
    redirect_to(:back)
  end

  def destroy
    flash[:success] = "You have successfully signed out."
    session.clear
    redirect_to items_path
  end
end
