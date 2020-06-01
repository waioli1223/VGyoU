class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){|u|
          u.permit(:user_id, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_alphabet, :first_name_alphabet, :nickname, :birthday)
      }
      devise_parameter_sanitizer.permit(:sign_in){|u|
          u.permit(:user_id, :password, :remember_me)
      }
  end
end