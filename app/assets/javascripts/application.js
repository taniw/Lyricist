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

$(function(){
	var BASE_PATH = "http://" + ( window.location.host || document.location.host );




	$('.search-song').click(function() {
		var q = $('.search-query').val();
		var search_by = $('.search-by-options-btn').text().trim();

		if (q.length >= 3) {
			$.ajax({
				url: BASE_PATH + "/search",
				 type: 'get',
				data: {
					q: q
				},
				success: function(response) {
					var source   = $("#song-search-results-tpl").html();
					var template = Handlebars.compile(source);
					$('.search-results').empty().append( template({data: response}) );
					goToSongOnClick();
				},
				error: function(response) {
					console.log("Nope...wrong");
				}
			});
		}
	});

	function goToSongOnClick(){
		$('.results-list li').click(function(e){
			var song_id = $(e.target).closest('li').attr('id');
			$.ajax({
				url: BASE_PATH + "/songs/" + song_id,
				 type: 'get',
				success: function(response) {
					var lyrics = response.document.response.song.lyrics.plain;
					var lyrics_div = $('.lyrics-' + response.id);
					lyrics_div.empty().append( lyrics.replace('\n\n', '<br><br>') ).show();

				},
				error: function(response) {
					console.log("Nope...wrong");
				}
			});
		});
	}

});

