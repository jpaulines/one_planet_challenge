class DashboardPolicy < Struct.new(:user, :dashboard)
  def dashboard?
    user
  end

  def my_challenges?
    user
  end

  def journey?
    user
  end

end
