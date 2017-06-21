class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      notice = "posted"
      redirect_to root_path
    else
      notice = "post failed"
      redirect_to root_path
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

end