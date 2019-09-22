class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]
  def index
    if params.present?
      @challenges = policy_scope(Challenge.where(effort: params[:effort].to_i, money: params[:money].to_i, time: params[:time].to_i))
        else
      @challenges = policy_scope(Challenge)
    end
  end

  def show
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

end
