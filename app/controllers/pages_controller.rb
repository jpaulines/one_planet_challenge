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
    score = params[:quiz][:food].to_i + params[:quiz][:home].to_i + params[:quiz][:mobility1].to_i + params[:quiz][:mobility2].to_i + params[:quiz][:product].to_i
    countries.each do |country|
      if country["isoa2"] == params[:quiz][:country_code]
        earth_counter = country["value"].to_f.round(1)
        # Where x is any integer, I have a value about x.1..x.4. I want to round it to x.5, and if it is above x.5, say x.7 or x.8, then it should round to (x+1).0. How is that possible? Is there a function in ruby?
        earth_counter = ((earth_counter * 2).ceil.to_f / 2)
      end
    end

    redirect_to result_path(result: earth_counter, country: params[:quiz][:country_code], score: score)

    # {"country_code"=>"AF", "food"=>"-10", "home"=>"0", "mobility1"=>"-10", "mobility2"=>"0", "product"=>"10"} permitted: false>, "commit"=>"Save Quiz", "controller"=>"pages", "action"=>"compute_result"} permitted: false>

  end

  def result
    @result = params[:result]
    @resulti = @result.to_i
    @resultf = @result.to_f - @result.to_i
    @score = params[:score].to_i
    country_code = params[:country]
    country = ISO3166::Country[country_code]
    @country = country.translations[I18n.locale.to_s] || country.name
  end

end
