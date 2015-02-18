module SessionsHelper
  def login(user)
  	# stores their id in the session
    session[:user_id] = user.id
    # stores the user in an instance variable
    @current_user = user
  end

  def logout
  	# set @current_user and session to nil and forgets the user
  	@current_user = session[:user_id] = nil
  end

  def logged_in?
  	if current_user == nil
  		redirect_to "/login"
  	end
  end

end

