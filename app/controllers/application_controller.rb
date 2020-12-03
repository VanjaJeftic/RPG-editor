class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(_resource)
    root_path(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "You can not manage types you did not created!"
    redirect_to '/types?show_all=true', :alert => exception.message
  end

end
