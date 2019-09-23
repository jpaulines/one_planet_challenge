class PostsController < ApplicationController

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
  end

  def new
    @user = current_user
    @post = Post.new
    authorize @post
  end

  def create

    @post = Post.new(post_params)
    authorize @post
    # we need `user_id` to associate review with corresponding user
    @user = current_user
    @post.user = @user
    @post.save
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end

end
