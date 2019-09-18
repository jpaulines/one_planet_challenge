class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]
  def index
    @challenges = policy_scope(Challenge)
  end

  def show
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

end
