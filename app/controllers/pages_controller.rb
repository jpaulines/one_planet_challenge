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



    # country = country_name
    countries.each do |country|
      if country["isoa2"] == params[:quiz][:country_code]
        earth_counter = country["value"].to_f.round(1)
        earth_counter = ((earth_counter * 2).ceil.to_f / 2)
      end
    end

    redirect_to result_path(result: earth_counter, country: params[:quiz][:country_code])
    # {"utf8"=>"✓", "authenticity_token"=>"wp8OQfE+2jQQLD0TgiV/RuERotL6QLDhhY5c/FQfAPRB0JXLp3RbBC/1os/IMadqNpGslFxYhmb2q6HJbffDTw==", "quiz"=>{"country_code"=>"AF"}, "commit"=>"Save Quiz"}

  end

  def result
    @result = params[:result]
    @result = ((@result * 2).ceil.to_f / 2)
    @result_complete = @result.to_i
    @result_half = @result - @result_complete
    country_code = params[:country]
    country = ISO3166::Country[country_code]
    @country = country.translations[I18n.locale.to_s] || country.name
  end

end
