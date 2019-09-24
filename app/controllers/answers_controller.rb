class AnswersController < ApplicationController

  def new
    # we need @post in our `simple_form_for`
    @post = Post.find(params[:post_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @post = Post.find(params[:post_id])
    @answer.post = @post
    @answer.save
    redirect_to post_path
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
