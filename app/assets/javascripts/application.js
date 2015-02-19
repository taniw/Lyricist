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
		e.preventDefault();
		// click the closest targeted li and get that specific song id
		var song_id = $(e.target).closest('li').attr('id');
		// shows the lyrics of the song by id
		var lyrics_div = $('.lyrics-' + song_id);

		// if lyrics is empty, be able to toggle and return the ajax call to show lyrics
		if( ! lyrics_div.is(':empty') ) {
			lyrics_div.toggle();
			return;
		}

		

		return false;
	});
};

Lyricist.addFavorite = function(songId){
	var lyrics_div = $('.lyrics-' + songId);
	if( ! lyrics_div.is(':empty') ) {
		return;
	}
	$.ajax({
		url: BASE_PATH + "/songs/" + songId,
		 type: 'get',
		success: function(response) {
			var lyrics = response.document.response.song.lyrics.plain;
			
			lyrics_div.empty().append( lyrics );

			var data = {
				api_id: songId,
				song_title: $('.song-title-display-' + songId).text(),
				song_artist: $('.song-artist-' + songId).text(),
				song_lyrics: $('.lyrics-' + songId).text()
			}
			$.post("/favorites", data)
			.done(function(fav){
				alert("Song is favorited!");
			});

		},
		error: function(response) {
			console.log("Nope...wrong");
		}
	});

	
};

