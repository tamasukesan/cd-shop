class Item < ApplicationRecord
	belongs_to :adminster
	has_many :discs
	has_many :tracks

	attachment :image
end
