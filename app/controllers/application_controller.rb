class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Want these method throughout entire program (not just sessionscontroller)
  # Can do this using INHERITANCE by including it in application_controller
  include SessionsHelper
  
end
