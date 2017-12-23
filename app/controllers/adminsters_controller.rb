class AdminstersController < ApplicationController

	def top
		@items = Item.all
	end

	def manage_users
		@users = User.all
		@users = @users.get_all params[:search]
	end

	def show
		@users = User.all
		if params[:search].present?
			@users = @users.get_all params[:search]
		end
		# @user = User.find(params[:id])
	end

	def show_user
		@user = User.find(params[:id])
		@orders = @user.orders.page(params[:page]).reverse_order
	end

	def edit_user_details
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
        	redirect_to adminsters_manage_users_path, notice: "更新しました。"
        else
        	render 'edit_user_details'
        end
	end


	def destroy
		
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone, :leave, :update_at, :email)
	end

	

end
