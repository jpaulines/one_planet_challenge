class DashboardsController < ApplicationController
  def dashboard
    @challenges = policy_scope(Challenge)
    @user_challenges = current_user.user_challenges

    # cumulated greenpoints score
    @greenpoints_score = []
    @score = current_user.greenpoint_score
    # greens per challenge
    @earned_greens_arr = []

    @user_challenges.each do |uc|
      @score += uc.challenge.greenpoint
      @greenpoints_score  << @score
      @earned_greens_arr << uc.challenge.greenpoint
    end
    @score
    @greenpoints_score
    @earned_greens_arr
    # cumulated challenges
    @challenges_score = (1..@user_challenges.count).to_a
    authorize :dashboard, :dashboard?
  end

  def my_challenges
    @challenges = policy_scope(Challenge)
    @user_challenges = current_user.user_challenges
    authorize :dashboard, :my_challenges?
    @score = 0
    @user_challenges.each do |uc|
      @score += uc.challenge.greenpoint
    end
    @score
  end

  def journey
    @challenges = policy_scope(Challenge)
    @user_challenges = current_user.user_challenges
    @score = 0
    @user_challenges.each do |uc|
      @score += uc.challenge.greenpoint
    end
    @score
    authorize :dashboard, :journey?
  end
end
