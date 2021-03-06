class UserChallengesController < ApplicationController
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UserChallenge.new(challenge: @challenge, user: current_user, completed: false)
    if @user_challenge.save!
      @challenge.challenge_steps.each do |step|
        @user_challenge_step = UserChallengeStep.create(completed: false, user_challenge: @user_challenge, content: step.content)
      end
    else
      redirect_to challenge_path(@challenge)
    end
    redirect_to my_challenges_path
    authorize :user_challenge, :create?
  end

  def update
    @user_challenge = UserChallenge.find(params[:id])

    @user_challenge.update(image: params[:user_challenge][:image]) if params[:user_challenge]
    @user_challenge.update(completed: true)
    current_user.greenpoint_score += @user_challenge.challenge.greenpoint
    current_user.save
    redirect_to dashboard_path
    authorize :user_challenge, :update?
  end

  def reactivate_challenge
    @user_challenge = UserChallenge.find(params[:id])
    @user_challenge.update(completed: false)
    redirect_to my_challenges_path
    authorize :user_challenge, :reactivate_challenge?
  end

  # def user_challenge_params
  #   params.require(:user_challenge).permit(:image)
  # end

end
