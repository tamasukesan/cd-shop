class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@orders = @user.orders.page(params[:page]).reverse_order
	end

	def index
		@user = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if params[:password].present? || params[:password_confirmation].present?
			if @user.update(user_params)
				sign_in(@user, bypass: true) 
	        	redirect_to user_path(@user.id), notice: "更新しました。"
	        else
	        	render 'edit'
	        end
	    else
	        render 'edit'
	    end
	end


	def destroy
		user = User.find(params[:id])
        user.update_attribute(:leave, false)
        sign_out(current_user)
        redirect_to root_path,  notice: "またのご利用しております！"
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone, :leave, :update_at, :email, :password, :password_confirmation)
	end

end
