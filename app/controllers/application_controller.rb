class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

#rubocop:disable all
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :image, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :image, :email, :password, :current_password)}
  end
end
