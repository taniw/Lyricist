class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Want these method throughout entire program (not just sessionscontroller)
  # Can do this using INHERITANCE by including it in application_controller
  include SessionsHelper
  
  private

  def current_user
  	# finds a logged in user using the session[:user_id]
  	@current_user = @current_user || User.find_by({id: session[:user_id]})
  end

  helper_method :current_user

end
