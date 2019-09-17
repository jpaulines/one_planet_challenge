class DashboardsController < ApplicationController

  def dashboard
    authorize :dashboard, :dashboard?
  end

  def my_challenges
  end

  def journey
  end

end
