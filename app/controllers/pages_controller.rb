require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :quiz, :compute_result, :result ]

  def home
  end

  def quiz

  end

  def compute_result
    filepath = "#{Rails.root}/storage/countries.json"
    serialized = File.read(filepath)
    countries = JSON.parse(serialized)
    earth_counter = nil
    countries.each do |country|
      if country["isoa2"] == params[:quiz][:country_code]
        earth_counter = country["value"].to_f.round(1)

      end

    end

    redirect_to result_path(result: earth_counter)
    # {"utf8"=>"✓", "authenticity_token"=>"wp8OQfE+2jQQLD0TgiV/RuERotL6QLDhhY5c/FQfAPRB0JXLp3RbBC/1os/IMadqNpGslFxYhmb2q6HJbffDTw==", "quiz"=>{"country_code"=>"AF"}, "commit"=>"Save Quiz"}

  end

  def result
    @result = params[:result]
  end
end
