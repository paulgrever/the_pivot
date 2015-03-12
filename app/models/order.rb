require 'date'

class Order < ActiveRecord::Base
	validates :user_id, :status_id, presence: true
	belongs_to :user

	def date
		created_at.strftime("%m-%d-%Y")
	end

	def time
		created_at.strftime("%I:%M %p")
	end
end
