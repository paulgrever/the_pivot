class BusinessOrder < ActiveRecord::Base
  belongs_to :business
  belongs_to :order
end
