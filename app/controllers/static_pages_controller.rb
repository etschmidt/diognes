class StaticPagesController < ApplicationController
	before_action :admin_user, only: [:admin]

  def admin
  	@top_posters = top_posters.limit(10)
  	@most_points = User.order('impressions_count desc').limit(10)
  	@recent_posts = Post.order('created_at desc').limit(10)
  end

	private

 	def admin_user		
		if !user_signed_in?
			redirect_to root_path
		elsif !current_user.admin?
			redirect_to root_path
		end
	end

	def top_posters
		User.joins('left join posts on users.id = posts.user_id')
				.select('users.*, count(posts.id) as posts_count')
				.group('users.id')
				.order('posts_count desc')
  end

end
