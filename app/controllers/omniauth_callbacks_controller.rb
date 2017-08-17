class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def all
		user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			flash.notice = "Signed in!"
			sign_in_and_redirect user
		else
			redirect_to root_path
		end
	end
	alias_method :twitter, :all
end