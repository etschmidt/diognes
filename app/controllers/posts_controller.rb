class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      notice = "posted"
      redirect_to current_user
    else
      notice = "post failed"
      redirect_to current_user
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

end