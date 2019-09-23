class UserInterestsController < ApplicationController
  def new
    @user = current_user
    @user_interest = UserInterest.new
    @user_interest.user = @user
    authorize @user_interest
  end

  def create
    @user = current_user
    @user_interest = UserInterest.new
    authorize @user_interest
    if params[:interests][:category_ids].blank? && params[:category_ids].blank?
      redirect_to new_user_interest_path, alert: "Please choose your preferences"
      return
    end
      params[:interests][:category_ids].each do |id|
      category = Category.find(id)
      @user_interest.update_attributes(category:category, user: current_user)
      @user_interest.save
    end
    redirect_to dashboard_path
  end

  private

  def user_interest_params
    params.require(:user_interest).permit(:user_id, :category_id)
  end
end
