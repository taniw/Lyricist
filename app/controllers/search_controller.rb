class SearchController < ApplicationController
	def index
		@songs = RapGenius.search( search_params ) || []
		render template: "search/index", json: @songs
	end

	private
  	  def search_params
  	    params.require(:q)
  	  end

end
