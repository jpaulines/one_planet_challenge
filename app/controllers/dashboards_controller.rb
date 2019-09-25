class DashboardsController < ApplicationController
  def dashboard
    @challenges = policy_scope(Challenge)
    @user_challenges = current_user.user_challenges

    # cumulated greenpoints score
    @greenpoints_progress = []

    # greens per challenge
    @earned_greens_arr = [0]
    progress = current_user.quiz_result
    @greenpoints_progress << progress
    @user_challenges.where(completed: true).each do |uc|
      progress += uc.challenge.greenpoint
      @greenpoints_progress << progress
      @earned_greens_arr << uc.challenge.greenpoint
    end
    # @score
    @greenpoints_progress
    @earned_greens_arr
    # cumulated challenges
    @challenges_score = (0..@user_challenges.count).to_a

    @rewards = current_user.users_rewards.where(shown: true).sort_by{|r| r.category_reward.max_challenges}.reverse

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
