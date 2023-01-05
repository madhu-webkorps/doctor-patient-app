class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password, :name, :address)
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.role == 'admin'
      admin_path
    elsif current_user.role == 'doctor'
      doctor_path
    else
      root_path
    end
  end
end
