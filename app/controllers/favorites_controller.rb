class FavoritesController < ApplicationController

	def create
		favorite = current_user.favorites.new({song_id: params[:songId]})
		render json: favorite
	end

end
