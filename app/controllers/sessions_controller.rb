class SessionsController < ApplicationController
  def new
  end

  def create
  	user_params = params.require(:user)
  	user = User.confirm(user_params[:username], user_params[:password])
  	if user
  		# using sessionshelper methods!
  		login(user)
  		redirect_to user_path(user.id)
  	else
  		# Flash an error message
  		flash[:error] = "Failed to Authenticate.Please try again."
  		redirect_to "/login"
  	end
  end
end
