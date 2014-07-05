$( document ).ready(function() {
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;

	function initialize() {
	  directionsDisplay = new google.maps.DirectionsRenderer();
	  var chicago = new google.maps.LatLng(41.850033, -87.6500523);
	  var mapOptions = {
	    zoom:7,
	    center: chicago
	  }
	  map = new google.maps.Map(document.getElementById("map"), mapOptions);
	  directionsDisplay.setMap(map);
	}

	function calcRoute() {
		var $map = $('#map');
	  var start = new google.maps.LatLng($map.data('start-lat'), $map.data('start-long'));
	  var end = new google.maps.LatLng($map.data('end-lat'), $map.data('end-long'));
	  var request = {
	    origin:start,
	    destination:end,
	    travelMode: google.maps.TravelMode.WALKING
	  };
	  directionsService.route(request, function(result, status) {
	    if (status == google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(result);
	    }
	  });
	}
  initialize();
	calcRoute();
});
