class CartsController < ApplicationController
	before_action :authenticate_user!
	def show
		@cart_items = current_user.carts
		@order = Order.new
		@user = current_user
		@user_valid = $user_valid
	end

	def create
		@cart = Cart.new(cart_params)
		@cart.user_id = current_user.id
		@cart.save
		redirect_to cart_path(current_user.id)
	end

	# def update
	# 	@order = current_order
	# 	@cart_item = Cart.find(params[:id])
	# 	@cart_item.update_attributes(cart_params)
	# 	@cart_items = @order.order_items
	# end

	def destroy
		@cart_item = Cart.find(params[:id])
		@cart_item.destroy
		redirect_to cart_path(current_user)
	end

	private
	def cart_params
		params.require(:cart).permit(:item_id, :user_id, :total_price, :quantity)
	end

end
