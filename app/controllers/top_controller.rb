class TopController < ApplicationController
  def index
  	@items = Item.page(params[:page]).per(8)
  	@cart = Cart.new
  	if params[:search].present?
		@items = @items.get_all params[:search]
	end

  end
end
