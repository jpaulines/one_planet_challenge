class DashboardsController < ApplicationController

  def dashboard
    authorize :dashboard, :dashboard?
  end

  def my_challenges
    authorize :dashboard, :my_challenges?
  end

  def journey
    authorize :dashboard, :journey?
  end

end
