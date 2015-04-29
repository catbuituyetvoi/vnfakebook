class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
  	registration_params = [:object_id,:image, :image_cache, :fullname, :username, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  end

  layout :choose_layout
  private
  def choose_layout
    if !current_user        # please, ignore it. this is not important
        'landing'
      else
        'application'
    end
  end

 
end
