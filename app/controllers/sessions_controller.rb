class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.full_name}."
      redirect_to user
    else
      flash[:notice] = 'Invalid login.'
      redirect_to login_path
    end
  end
end
