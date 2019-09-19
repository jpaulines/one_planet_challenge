class DashboardsController < ApplicationController

  def dashboard
    authorize :dashboard, :dashboard?
  end

  def my_challenges
    authorize :dashboard, :my_challenges?
    @challenges = policy_scope(Challenge)
    @user_challenges = current_user.user_challenges
  end

  def journey
    authorize :dashboard, :journey?
  end

end
