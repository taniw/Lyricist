class SearchController < ApplicationController
	def index
		song = nil
	
		search_by = search_params[:search_by]
		
		if search_by == "artist"
			@song = RapGenius::Song.find(search_by_artist(search_by).id)

		elsif search_by == "title"
			@song = RapGenius::Song.find(search_by_title(search_by).id)

		elsif search_by == "lyrics"
			@song = RapGenius::Song.find(search_by_lyrics(search_by).id)
		end

		respond_to do |format|
            format.html { render :index }
            format.json { render json: @song }
        end
	end


	def search_by_artist(artist)
		RapGenius.search_by_artist(artist)
	end

	def search_by_title(title)
		RapGenius.search_by_title(title)
	end

	def search_by_lyrics(lyrics)
		RapGenius.search_by_lyrics(lyrics)
	end

	private
  	  def search_params
  	    params.require(:search_by)
  	  end

end
