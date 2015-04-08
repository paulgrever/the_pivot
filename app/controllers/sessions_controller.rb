class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session]
      user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.full_name}."
        redirect_to items_path
      else
        flash[:danger] = "Invalid login."
        render(:new)
      end
    else
      user = User.find_or_create_from_auth(request.env["omniauth.auth"])
      if user
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.full_name}."
        redirect_to items_path
      else
        flash[:danger] = "Invalid login."
        render(:new)
      end
    end
  end

  def destroy
    flash[:success] = "You have successfully signed out."
    session.clear
    redirect_to root_path
  end

  def failure
    render text: "Authentication failed. Please try again."
  end
end
