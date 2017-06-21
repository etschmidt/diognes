class UsersController < ApplicationController

	before_action :signed_in_user, only: [:current_user_home]

	def show
		@user  = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def current_user_home
	  redirect_to current_user
	end

	private  

	def user_params
		params.require(:user).permit(:name, :email, :description, :private)
	end

	def signed_in_user
		unless user_signed_in?
			redirect_to new_user_session_path
		end
	end

end