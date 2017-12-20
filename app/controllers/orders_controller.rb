class OrdersController < ApplicationController
    def create
        @order = current_user.orders.new(order_params)
        # @order.total = Cart.quantity*item.price
        @order.save

        sum_count = 0
        current_user.carts.each do |cart|
            @order_item = @order.order_items.new
            @order_item.item_id = cart.item_id
            @order_item.subtotal = cart.quantity*cart.item.price
            @order_item.status = cart.item.item_status
            @order_item.quantity = cart.quantity
            sum_count += @order_item.subtotal
            @order.total = sum_count
            # binding.pry
            @order_item.save
            @order.save
            cart.delete
        end
        redirect_to user_path(current_user.id)
    end

	def show
		@order = Order.find(params[:id])
	end

	def index
		@orders = Order.all
	end

	private
      def order_params
        params.require(:order).permit(:user_id, 
        							  :billing_first_name, 
        							  :billing_last_name, 
        							  :billing_first_name_kana, 
        							  :billing_last_name_kana, 
        							  :billing_post_code, 
        							  :billing_phone, 
        							  :billing_address, 
        							  :buy_at, 
        							  :total)
      end
end
