function initMap() {
    
    //Init Center
    var myLatLng = {lat: 1.3, lng: 36};


    // Create a map object and specify the DOM element
    // for display.
    
    var map = new google.maps.Map(document.getElementById('locator'), {
      center: myLatLng,
      zoom: 6
    });

    //Infowindow
    //Geocoder
    //County
    var geocoder = new google.maps.Geocoder;
    var infoWindow = new google.maps.InfoWindow;
    var county;

    //Use Geolocation service to get center
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };

          //Call Reverse Geocoding service
          geocodeLatLng(geocoder, map, infoWindow);

          //Do reverse geocoding and get administrative area of current location
          function geocodeLatLng(geocoder, map, infoWindow){
              geocoder.geocode({'location':pos}, function(results, status){
                console.log(results)
                  if(status === 'OK'){
                      if(results[0]){
                          infoWindow.setContent(results[0].formatted_address);
                          infoWindow.open(map);
                      }
                      else{
                          window.alert('No results found.');
                      }
                  }
                  else{
                      window.alert('Geocoder failed due to: '|+ status);
                  }
              })
          }

          infoWindow.setPosition(pos);
          //infoWindow.setContent('Your Location');
          infoWindow.open(map);
          map.setCenter(pos);
          map.setZoom(10);
        }, function() {
          handleLocationError(true, infoWindow, map.getCenter());
        });
      } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
      }
   

    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }

    //Load Kenya GeoJson
    map.data.loadGeoJson('json/kenya-geo.json');

    //Style Geojson DataLayer
    map.data.setStyle({
        fillColor: '#FA8072',
        strokeWeight: 0.5,
        strokeColor: 'white'
      });

    
    
  }
