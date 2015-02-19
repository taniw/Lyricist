// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var BASE_PATH = "http://" + ( window.location.host || document.location.host );
	// setting the url to http://localhost:3000 for whichever browser I use

var Lyricist = {};

Lyricist.toggleSongLyricsOnClick = function(){
	// when you click on one of the search results
	$('.results-list li').click(function(e){
		// click the closest targeted li and get that specific song id
		var song_id = $(e.target).closest('li').attr('id');
		// shows the lyrics of the song by id
		var lyrics_div = $('.lyrics-' + song_id);

		// if lyrics is empty, be able to toggle and return the ajax call to show lyrics
		if( ! lyrics_div.is(':empty') ) {
			lyrics_div.toggle();
			return;
		}

		$.ajax({
			url: BASE_PATH + "/songs/" + song_id,
			 type: 'get',
			success: function(response) {
				var lyrics = response.document.response.song.lyrics.plain;
				
				lyrics_div.empty().append( lyrics.replace('\n\n', '<br><br>', '\n\n\n\n\n\n\n\n\n\n\n\n', "<br><br>") ).show();

			},
			error: function(response) {
				console.log("Nope...wrong");
			}
		});
	});
}

Lyricist.addFavorite = function(songId){
	$.post("/favorites", { api_id: songId} )
	.done(function(fav){
		alert("Song is favorited!");
	});
};

