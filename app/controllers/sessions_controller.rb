class SessionsController < ApplicationController
  def new
  end

  def create
  	user_params = params.require(:user)
    user = User.find_by_username(user_params[:username])
  	if user.authenticate(user_params[:password])
  		# using sessionshelper methods!
  		login(user)
  		redirect_to root_path(user.id)
  	else
  		# Flash an error message
  		flash[:error] = "Failed to Authenticate.Please try again."
  		redirect_to "/login"
  	end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
