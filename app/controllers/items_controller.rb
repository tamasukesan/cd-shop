class ItemsController < ApplicationController
	def new
		@item = Item.new
		1.times do
			disc = @item.discs.build
		 		1.times{ disc.tracks.build }
		end
	end

	def create
		@item = Item.new(item_params)
		@item.adminster_id = current_adminster.id
		if @item.save
			redirect_to items_path
		else
			render :new
		end
	end

	def edit
		@item = Item.find(params[:id])
		0.times do
			disc = @item.discs.build
		 		0.times{ disc.tracks.build }
		 end
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to item_path
		else
			render :template => "items/edit"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.update_attribute(:active, false)
		redirect_to items_path
	end

	def index
		@items = Item.all
		if params[:search].present?
			@items = @items.get_all params[:search]
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	private
	def item_params
	  params.require(:item).permit(:adminster_id, 
	  							   :artist_name, 
	  							   :artist_name_kana, 
	  							   :album_name, 
	  							   :price, 
	  							   :label_name, 
	  							   :genre, 
	  							   :cd_image, 
	  							   :stock, 
	  							   :luanch_date, 
	  							   :editor, 
	  							   :item_status,
	  							   discs_attributes: [:id, 
	  							   					  :disc_number, 
	  							   					  :disc_name, 
	  							   					  :_destroy,
	  							   					  tracks_attributes: [:id, 
	  							   					  					  :track_number, 
	  							   					  					  :track_name, 
	  							   					  					  :artist_name, 
	  							   					  					  :_destroy
	  							   					  					  ]
	  							   					  ]
	  							   	)
	end
end
