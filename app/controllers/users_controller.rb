class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def index
		@user = User.all
		
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		
	end

	def destroy
		
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone, :leave, :update_at)
	end
end
