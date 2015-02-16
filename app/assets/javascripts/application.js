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
	var BASE_PATH = window.location.host || document.location.host;


	$('.search-song').click (function() {
		var q = $('.search-query').val();
		if (q.length > 3) {
			$.ajax({
				type: 'GET',
				url: BASE_PATH + "/search_results",
				data: {
					search_by: q,
				},
				// jsonp: 'callback',
				// dataType: 'jsonp',
				success: function(response) {
					console.log("yes!success");
				},
				error: function(response) {
					console.log("Nope...wrong");
				}
			});
		}

	});









});

