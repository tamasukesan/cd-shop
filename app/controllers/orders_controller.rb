class OrdersController < ApplicationController
    def create
        @user = current_user
        @order = current_user.orders.new(order_params)
        @order.billing_first_name = params[:order][:billing_first_name]
        @order.billing_last_name = params[:order][:billing_last_name]
        @order.billing_first_name_kana = params[:order][:billing_first_name_kana]
        @order.billing_last_name_kana = params[:order][:billing_last_name_kana]
        @order.billing_post_code = params[:order][:billing_post_code]
        @order.billing_phone = params[:order][:billing_phone]
        @order.billing_address = params[:order][:billing_address]
        @order.status = 0

        if @order.save

            sum_count = 0
            current_user.cart.each do |cart|
                @order_item = @order.order_items.new
                @order_item.item_id = cart.item_id
                @order_item.subtotal = cart.quantity*cart.item.price
                @order_item.status = cart.item.item_status
                @order_item.quantity = cart.quantity
                sum_count += @order_item.subtotal
                @order.billing_first_name = params[:order][:billing_first_name]
                @order.total = sum_count
                @order_item.save
                @order.save
                cart.delete

                redirect_to user_path(current_user.id)
            end
        else
            render "carts/show"
        end


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
                                  :total, 
                                  :status)
    end

end
