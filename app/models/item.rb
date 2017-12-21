class Item < ApplicationRecord
	belongs_to :adminster
    has_many :order_items
    has_many :discs, :dependent => :destroy
	has_many :tracks, :dependent => :destroy
	attachment :image

	has_many :carts

	attachment :cd_image


	#scope :get_by_album_name, ->(album_name){ where( "album_name like ?", "%#{album_name}%" )}
	#scope :get_by_artist_name, ->(artist_name) { where("artist_name like ?", "%#{artist_name}%" )}
	#scope :get_by_artist_name_kana, ->(artist_name_kana) { where("artist_name_kana like ?", "%#{artist_name_kana}

	scope :get_all, ->(search) { where(Item.arel_table[:album_name].matches("%#{search}%").or(Item.arel_table[:artist_name_kana].matches("%#{search}%").or(Item.arel_table[:artist_name].matches("%#{search}%")))) }
	scope :active, -> {where(deleted:false)}
   
	accepts_nested_attributes_for :discs, allow_destroy: true

	validates :album_name,
			  :artist_name,   
			  :label_name, 
			  :genre, 
			  :stock, 
			  :luanch_date, 
			  :editor, 
			  :item_status,  
			  				presence: true

	validates :artist_name_kana, 
			 				format:{ with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/, 
						    message: '全角カナで入力して下さい' }
	validates :price, 
					numericality: { greater_than_or_equal_to: 1, only_integer: true} 

	# validates :cd_image, 
	# 				format: { with: %r{\.(gif|jpg|png)\Z}i,
	# 				message: 'gif,png,jpgファイルをアップロートしてください'}

end
