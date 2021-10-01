class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    def after_sign_in_path_for(current_user)
      if (current_user.role == "organizer")
      musics_path
      else
      listner_path
      end
    end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password,:password_confirmation,:role])
  end
end
