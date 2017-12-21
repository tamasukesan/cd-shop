class AdminstersController < ApplicationController

	def top
		@items = Item.all
	end

	def manage_users
		@users = User.all
	end

	def show_user
		
	end

	def edit_user_details
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	end

	def destroy
		
	end
end
