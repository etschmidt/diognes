class PostsController < ApplicationController
  impressionist actions: [:show] # for tracking views &c.
  before_action correct_user: :destroy
  around_action :catch_not_found

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
    redirect_to current_user
  end

  def show
    @post = Post.find(params[:id])
    impressionist(@post)
  end

  def index  #this is a terrible hack
    @post = Post.find_by id: params[:search]
    if @post.present?
      redirect_to @post
    else
      redirect_to fail_path #request.env["HTTP_REFERER"]
    end
  end

  private

    def post_params
      params.require(:post).permit(:content, :signed, :dated)
    end

    def correct_user
      if current_user.admin?
        @post = Post.find_by(id: params[:id])
      else
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to root_url if @post.nil?
      end
    end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to fail_path
  end

end