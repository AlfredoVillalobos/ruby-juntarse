class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_user
    User.current = current_user
  end

  protected

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] ||
      stored_location_for(resource) ||
      steps_aditional_data_path(current_user.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
