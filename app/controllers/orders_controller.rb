class OrdersController < ApplicationController
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
