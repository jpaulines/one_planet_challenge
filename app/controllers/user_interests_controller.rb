class UserInterestsController < ApplicationController
  def new
    @user = current_user
    @user_interest = UserInterest.new
    @user_interest.user = @user
    authorize @user_interest
  end

  def create
    @user = current_user
    @user_interest = UserInterest.new(user_interest_params)
    @user_interest.user = @user
    authorize @user_interest
    if @user_interest.save!
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  private

  def user_interest_params
    params.require(:user_interest).permit(:user_id, :category_id)
  end
end
