class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else #saving the user is unsuccessful
      #populate the flash hash with the errors present in active record
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to root_path
      # render html: @user.errors.full_messages
    end
  end

  def show
    @songs = User.find(params[:id]).songs
  end

  private
  	def user_params
  		params.require(:user).permit(:username, :password, :email)
  	end
end
