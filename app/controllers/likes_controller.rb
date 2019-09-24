class LikesController < ApplicationController
  def create
    @like = Like.new
    authorize @like
    # we need `restaurant_id` to associate review with corresponding restaurant
    @post = Post.find(params[:post_id])
    @like.user = current_user
    @like.post = @post
    @like.save
    respond_to do |format|
      format.html { redirect_to post_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
