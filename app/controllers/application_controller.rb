class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

	def signed_in_user
		unless user_signed_in?
			redirect_to new_user_session_path
		end
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :private])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :private, :current_password]) 
  end

end
