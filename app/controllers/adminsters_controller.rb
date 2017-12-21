class AdminstersController < ApplicationController
	
	def top
		@items = Item.all
	end

	def manage_users
		@users = User.all
	end

	def edit_user_details
		@user = User.find(params[:id])
		# adminのデータ持ってくるのを記述する
	end

	def update
	end

	protected
	def after_sign_in_path_for(resource)
  		items_path
  	end
end
