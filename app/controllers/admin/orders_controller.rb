class Admin::OrdersController < ApplicationController

	def index
		if current_user.admin?
			@orders = Order.all
		else
			flash[:notice] = 'You are not authorized to access this page.'
			redirect_to login_path
		end
	end

		def show
			@order = Order.find(params[:id])
		end
end
