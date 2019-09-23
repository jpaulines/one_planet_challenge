class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]
  def index

    if params["challenge"]
      @challenge_categories = params["challenge"]["category_ids"]
      @challenges = policy_scope(Challenge).where(category: (@challenge_categories)).sort_by {|c| c.created_at}
      #@challenges = policy_scope(Challenge.where(effort: params[:effort].to_i, money: params[:money].to_i, time: params[:time].to_i))
        else
      @challenge_categories = ""
      @challenges = policy_scope(Challenge).order(created_at: :desc)
    end
    @popular_challenges = Challenge.all.sort{ |challenge_a, challenge_b| challenge_a.users.count <=> challenge_b.users.count}
  end

  def show
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

  def challenge_params
    params.require(:challenge).permit( :category_ids)
  end
end
