class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to root_path
      # render html: @user.errors.full_messages
    end
  end

  def show
  end

  private
  	def user_params
  		params.require(:user).permit(:username, :password, :email)
  	end
end
