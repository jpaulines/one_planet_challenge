class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]
  before_action :set_user, only: [ :edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to new_user_interest_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :address, :money_level, :effort_level, :time_level, :greenpoint_score, :planet_country, :planet_user, :image)
    # authorize @user
  end
end
