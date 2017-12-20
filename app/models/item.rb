class Item < ApplicationRecord
	belongs_to :adminster
	has_many :carts
	has_many :discs
	has_many :tracks
    has_many :order_items


	attachment :cd_image
end
