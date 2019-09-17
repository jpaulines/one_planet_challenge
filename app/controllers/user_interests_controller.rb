class UserInterestsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @user_interest = User_interest.new
  end
end
