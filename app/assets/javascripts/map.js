$( document ).ready(function() {
	var directionsDisplay = new google.maps.DirectionsRenderer();
	var directionsService = new google.maps.DirectionsService();
	var map;
	var $map = $('#map');
  var start = new google.maps.LatLng($map.data('start-lat'), $map.data('start-long'));
  var end = new google.maps.LatLng($map.data('end-lat'), $map.data('end-long'));
	var path;
	
	function initialize() {
	  var mapOptions = {
	    zoom:7
	  }
	  map = new google.maps.Map(document.getElementById("map"), mapOptions);
	  directionsDisplay.setMap(map);
		service = new google.maps.places.PlacesService(map);
	}

	function findPath() {
	  var request = {
	    origin:start,
	    destination:end,
	    travelMode: google.maps.TravelMode.WALKING
	  };
	  directionsService.route(request, function(result, status) {
	    if (status == google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(result);
				path = result.routes[0];
				console.log(path)
				searchForBarsAtPath();
	    }
	  });
	}
	
	function searchForBarsAtPath() {
		$.each(path.overview_path, function( index, point ) {
			searchForBarsAtPoint(point);
		});
	}
	
	function searchForBarsAtPoint(point) {
		var request = {
	    location: point,
	    radius: '1',
	    query: 'bar'
	  };
		service.textSearch(request, callback);
	}
		
	function callback(results, status) {
	  if (status == google.maps.places.PlacesServiceStatus.OK) {
	    for (var i = 0; i < results.length; i++) {
	      var place = results[i];
	      createMarker(results[i]);
	    }
	  }
	}
	
	function createMarker(place) {
		var bars = $('.bars ul');
		console.log(place)
		var marker = new google.maps.Marker({
      position: place.geometry.location,
      map: map,
			title: place.name
	  });
		bars.append(
      $('<li>').append(
        $('<a>').attr('href','#').append(
          $('<span>').attr('class', 'tab').append(place.name)
    )));
	}
		
// Main
  initialize();
	findPath();
});
