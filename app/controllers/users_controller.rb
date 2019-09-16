class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: [:edit]

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
