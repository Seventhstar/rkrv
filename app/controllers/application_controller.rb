require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json
  include SessionsHelper

  before_action :set_paper_trail_whodunnit
  # protect_from_forgery with: :null_session
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def authenticate_admin_user!

    redirect_to login_path unless current_user && current_user.admin == true
  end

  protected

  # def configure_permitted_parameters
  #   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  #   devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  #   devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
  #   # devise_parameter_sanitizer.for(:sign_up) do |u|
  #     # u.permit(:username, :email, :password, :password_confirmation)
  #   # end

  #   # devise_parameter_sanitizer.for(:sign_in) do |u|
  #     # u.permit(:username, :password, :remember_me)
  #   # end
  # end



  # def authenticate_user_from_token!
  #   email = params[:email].presence
  #   user  = email && User.find_by_email(email)

  #   if user && Devise.secure_compare(user.token, params[:token])
  #     sign_in user, store: false
  #   end
  # end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  #   devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  # end

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) || products_path
  # end

  def logged_in_user

    if request.format == 'application/json'
      puts "params #{params}"
      token = params[:token]
      user = User.find_by(token: token) if token.present?
      if user
        log_in user
      else
        # head :unauthorized
        errors = { error: 'Токен не найден' }
        render json: errors, status: :unauthorized
      end
    else
      puts "check logged_in_user #{action_name}, controller_name #{controller_name}, current_user #{current_user}"
      unless !current_user.nil?
        # qjwheh
        store_location
        # flash[:danger] = "Выполните вход."
        redirect_to login_url if controller_name != 'users' 
        # || action_name != 'new'
      end
    end
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
