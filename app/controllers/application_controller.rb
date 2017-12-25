class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Adminster)
        items_path
      else
        root_path
      end
    end

  protected
  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: [:update_attrs]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, 
    	                                               :first_name, 
    	                                               :last_name, 
    	                                               :first_name_kana, 
    	                                               :last_name_kana, 
    	                                               :post_code, 
    	                                               :address, 
    	                                               :phone, 
    	                                               :leave])
  end


end
