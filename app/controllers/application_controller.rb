class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  # Add username to devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  attr_accessor :login

  protected

  # Add username to devise
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # Check for valid URI
  def uri?(string)
    URI.parse(string)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end
