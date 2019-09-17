class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_interests_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def event_params
   params.require(:user).permit(:first_name, :last_name, :email, :address, :image)
  end
end
