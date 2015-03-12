require 'date'

class Order < ActiveRecord::Base
	validates :user_id, :status_id, :created_at, presence: true
	belongs_to :user

	def date
		# created_at = Order.find(params[:created_at])
		created_at.strftime("%Y-%m-%d")
	end

	def time
		created_at.strftime("%I:%M %p")
	end

end
