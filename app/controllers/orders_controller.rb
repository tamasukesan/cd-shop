class OrdersController < ApplicationController
    def create
        @user = current_user
        # @user_valid = current_user
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
            current_user.carts.each do |cart|
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
            end
            redirect_to user_path(current_user.id)
        else
            $user_valid = User.new
            $user_valid.first_name = params[:order][:billing_first_name]
            $user_valid.last_name = params[:order][:billing_last_name]
            $user_valid.first_name_kana = params[:order][:billing_first_name_kana]
            $user_valid.last_name_kana = params[:order][:billing_last_name_kana]
            $user_valid.post_code = params[:order][:billing_post_code]
            $user_valid.phone = params[:order][:billing_phone]
            $user_valid.address = params[:order][:billing_address]


            redirect_to cart_path(current_user), flash: { error: @order.errors.full_messages }
        end
    end

	def show
		@order = Order.find(params[:id])
	end

	def index
		@orders = Order.all
	end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to adminsters_show_user_path(params[:user_id])
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
