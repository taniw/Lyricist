class SongsController < ApplicationController

  def index
  	@id = song_params
  	@song = RapGenius::Song.find( @id )
  	render 'index', json: @song
  end

  private
  	  def song_params
  	    params.require(:song_id)
  	  end
end	
