class Status < ActiveRecord::Base
  has_many :orders
end
