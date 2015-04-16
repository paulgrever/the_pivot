class AdminController < ApplicationController
  before_action :authorize_user

  def authorize_user
    if current_user.nil? || !current_user.admin?
      redirect_to root_path
    end
  end
end
