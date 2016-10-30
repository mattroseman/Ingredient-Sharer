class ApplicationController < ActionController::Base
  attr_accessor :login


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # this is required to redirect those who are not logged in.
  before_filter :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


  # sets the time zone for user
  around_action :set_time_zone, if: :current_user

  def set_time_zone(&block)
    time_zone = current_user.time_zone || 'EST'
    Time.use_zone(time_zone, &block)
  end

end
