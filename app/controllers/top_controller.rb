class TopController < ApplicationController
  def index
  	@items = Item.all
  	@cart = Cart.new
  	if params[:search].present?
		@items = @items.get_all params[:search]
	end

  end
end
