class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :quiz]

  def home
  end

  def quiz
  end

end
