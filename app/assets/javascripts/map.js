$( document ).ready(function() {
	var directionsDisplay = new google.maps.DirectionsRenderer();
	var directionsService = new google.maps.DirectionsService();
	var map;
	var $map = $('#map');
  var start = new google.maps.LatLng($map.data('start-lat'), $map.data('start-long'));
  var end = new google.maps.LatLng($map.data('end-lat'), $map.data('end-long'));
	var step = 0;
	var percentage = 0.0;
	var path;
	var bars = [];
	
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
	  directionsService.route(request, findPathCallback);
	}
	
	function findPathCallback(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);
			path = result.routes[0];
			console.log(path.overview_path.length)
			searchForBarsAtPoint();
    }
	}
	
	function searchForBarsAtPoint() {
		var request = {
	    location: path.overview_path[step],
	    radius: '1',
	    query: 'bar'
	  };
		service.textSearch(request, callback);
	}
		
	function callback(results, status) {
	  if (status == google.maps.places.PlacesServiceStatus.OK) {
			$.each(results, function( index, bar ) {
				if(bars.map(function(e) { return e.place_id; }).indexOf(bar.place_id) == -1) {
					createMarker(bar);
					bars.push(bar);
				}
			});	
	  } 
		
		if(step++ != path.overview_path.length) {
			percentage = step / path.overview_path.length * 100;
			$('#percentage').html(" " + percentage.toFixed(2) + "%")
			setTimeout(searchForBarsAtPoint, 10);
		}
	}
	
	function createMarker(place) {
		var bars = $('.bars ol');
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
