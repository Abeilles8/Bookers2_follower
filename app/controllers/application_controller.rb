class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :baria_user, only: [:edit, :update, :destroy]

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
    end

    def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end

    def baria_user
      unless Book.find(params[:id]).user.id.to_i == current_user.id
          redirect_to books_path(current_user)      
      end
    end
    
end
