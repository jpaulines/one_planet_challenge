class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    authorize @answer
    # we need `restaurant_id` to associate review with corresponding restaurant
    @post = Post.find(params[:post_id])
    @answer.user = current_user
    @answer.post = @post
    @answer.save
    redirect_to post_path(@post)
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
