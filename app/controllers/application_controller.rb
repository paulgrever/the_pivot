class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :cart
  before_action :load_cart

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to items_path, alert: exception.message
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def cart
    @cart
  end

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end
end
