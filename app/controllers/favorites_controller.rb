class FavoritesController < ApplicationController
	
	def create
		song = Song.create(api_id: params[:api_id])
		favorite = current_user.favorites.new({song_id: song.id})
		favorite.song_id = song.id
		favorite.save
		render json: favorite
	end

end
