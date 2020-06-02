class ApplicationController < ActionController::Base
  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加する  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){|inf|
          inf.permit(:user_id, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_alphabet, :first_name_alphabet, :nickname, :birthday)
      }
      devise_parameter_sanitizer.permit(:sign_in){|inf|
          inf.permit(:user_id, :password, :nickname, :remember_me)
      }
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update){|inf|
          inf.permit(:password, :password_confirmation, :profile)
      }
  end

    #   private

    #   # ログイン後のリダイレクト先
    #   def after_sign_in_path_for(resource_or_scope)
    #     if resource_or_scope.is_a?(AdminUser)
    #         user_path
    #     else
    #       root_path
    #     end
    #   end
    
    #   # ログアウト後のリダイレクト先
    #   def after_sign_out_path_for(resource_or_scope)
    #     if resource_or_scope == :admin_admin_user
    #       new_admin_admin_user_session_path
    #     else
    #       new_user_session_path
    #     end
    #   end
end