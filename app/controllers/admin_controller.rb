class AdminController < ApplicationController
  before_action :authorize_admin_access

  def authorize_admin_access
    authorize! :manage, Order
  end
end
