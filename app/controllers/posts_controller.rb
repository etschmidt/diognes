class PostsController < ApplicationController
  impressionist actions: [:show] # for tracking views &c.

  before_action correct_user: :destroy

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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    notice = "post deleted"     
    respond_to do |format|
      format.js {render inline: "location.reload();" }
      format.html { redirect_to request.referer }
    end
  end

  def show
    @post = Post.find(params[:id])
    impressionist(@post)
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

   def correct_user
     if current_user.admin?
       @post = Post.find_by(id: params[:id])
     else
       @post = current_user.posts.find_by(id: params[:id])
       redirect_to root_url if @post.nil?
     end
   end

end