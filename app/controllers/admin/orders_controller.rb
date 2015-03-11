class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
		authorize! :manage, Order
	end

	def show
		@order = Order.find(params[:id])
		authorize! :manage, Order
	end
end
