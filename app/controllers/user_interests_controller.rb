class UserInterestsController < ApplicationController
  def new
    @user = current_user
    @user_interest = UserInterest.new
    # @user_interest.user = @user
    authorize @user_interest
  end

  def create
    @user = current_user
    @ui = UserInterest.new
    authorize @ui
    if params[:interests][:category_ids].blank? && params[:category_ids].blank?
      # need to authorize to continue on to redirect
      redirect_to new_user_interest_path, alert: "Please choose your preferences"
    end
    params[:interests][:category_ids].each do |id|
      category = Category.find(id.to_i)
      next if current_user.categories.include?(category)
      @user_interest = UserInterest.new(category: category, user: current_user)
      @user_interest.save
    end
    current_user.user_interests.each do |user_interest|
      unless params[:interests][:category_ids].include? user_interest.category_id.to_s
        user_interest.destroy
      end
    end
    redirect_to challenges_path
  end

  private

  def user_interest_params
    params.require(:user_interest).permit(:user_id, :category_id)
  end
end
