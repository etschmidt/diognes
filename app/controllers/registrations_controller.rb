class RegistrationsController < Devise::RegistrationsController

  private

  def after_update_path_for(resource)
    user_path(resource)
  end
    
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description, :private)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description, :private, :current_password)
  end

end