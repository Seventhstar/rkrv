require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  #include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || welcome_path
  end

  # def logged_in_user
  #   user_signed_in?
  #   # retu
  #     # unless logged_in?
  #       # store_location
  #       # redirect_to login_url
  #     #end
  # end
end
