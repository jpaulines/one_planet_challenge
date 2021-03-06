class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :address, :money_level, :effort_level, :time_level, :quiz_result, :planet_country, :planet_user, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :address])
  end

  def after_sign_up_path_for(resource)
    edit_user_path(resource)
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  # step from https://www.lewagon.com/blog/setup-meta-tags-rails
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

   private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
