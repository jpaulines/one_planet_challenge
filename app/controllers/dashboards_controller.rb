class DashboardsController < ApplicationController

  def dashboard
    @challenges = policy_scope(Challenge)
    @user_challenges = current_user.user_challenges
    @greenpoints_score = 0
    @user_challenges.each do |uc|
      @greenpoints_score += uc.challenge.greenpoint
    end
    @greenpoints_score

    @test = "Hello"

    authorize :dashboard, :dashboard?
  end

  def my_challenges
    @challenges = policy_scope(Challenge)
    @user_challenges = current_user.user_challenges
    authorize :dashboard, :my_challenges?
  end

  def journey
    authorize :dashboard, :journey?
  end

end
