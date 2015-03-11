class AdminController < ApplicationController
  before_action :authorize_order_access

  def authorize_order_access
    authorize! :manage, Order
  end
end
