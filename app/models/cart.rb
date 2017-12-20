class Cart < ApplicationRecord
	include ActiveRecord::Calculations
	belongs_to :item
	belongs_to :user
end
