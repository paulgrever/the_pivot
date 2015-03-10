class Order < ActiveRecord::Base
	validates :user_id, :status_id, presence: true

end
