class FavoritesController < ApplicationController
	
	def create
		song = Song.create({
			api_id: params[:api_id],
			title: params[:song_title],
			artist: params[:song_artist],
			lyrics: params[:song_lyrics]
		})

		Favorite.create({song_id: song.id, user_id: current_user.id})
	end

	def destroy
		Favorite.find_by_song_id(params[:song_id]).destroy
	end
end
