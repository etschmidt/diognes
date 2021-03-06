class UsersController < ApplicationController
	impressionist actions: [:show] # for tracking views &c.

	around_action :catch_not_found

	before_action :signed_in_user, 	only: [:current_user_home]
	before_action :private?, 		only: [:show]
	before_action :correct_user?, 	only: [:edit, :update]

	def show
		@user  = User.find(params[:id])
		@posts = @user.posts
		@post = current_user.posts.build if current_user == @user
		@points = @user.impressions.where(created_at: (Time.now - 1.month)..Time.now).count 
		@post_points = @user.posts.sum(:impressions_count)
		impressionist(@user)
	end

=begin
	def edit
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def update
		@user = User.find(params[:id])
		@posts = @user.posts
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end
=end

	def current_user_home
	  redirect_to current_user
	end

	def index  #this is a terrible hack
	  @user = User.find_by id: params[:search]
	  if @user.present?
		  redirect_to @user
		else
			redirect_to fail_path #request.env["HTTP_REFERER"]
		end
	end

	private

	def correct_user?
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to @user
		end
	end

	def private?
		@user = User.find(params[:id]) 
		if user_signed_in?
			if @user.private? && current_user != @user && !current_user.admin?
				redirect_to fail_path
			end
		elsif @user.private?
			redirect_to fail_path
		end
	end

	def catch_not_found
	  yield
	rescue ActiveRecord::RecordNotFound
	  redirect_to fail_path
	end

end