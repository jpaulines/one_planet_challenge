class DashboardPolicy < Struct.new(:user, :dashboard)
  def dashboard?
    user
  end

end
