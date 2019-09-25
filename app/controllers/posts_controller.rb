class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
    @user = current_user
    @post = Post.new
    @like = Like.new

    if params[:query].present?
      challenges = Challenge.where("name ILIKE ?", "%#{params[:query]}%")
      @posts = []
      challenges.each do |challenge|
        matches = Post.where(challenge: challenge)
        @posts << matches
      end
      @posts = @posts.flatten
    else
      @posts = Post.all
    end

  end

  def new
    @user = current_user
    @post = Post.new
    authorize @post
  end

  def show
    # we need @post in our `simple_form_for`
    @answer = Answer.new
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
    params.require(:post).permit(:content, :title, :challenge_id)
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

end
