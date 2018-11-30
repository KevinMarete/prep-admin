function initMap() {
    
    //Init Center
    var myLatLng = {lat: 1.3, lng: 36};


    // Create a map object and specify the DOM element
    // for display.
    
    var map = new google.maps.Map(document.getElementById('locator'), {
      center: myLatLng,
      zoom: 12
    });

    //Infowindow
    //Geocoder
    //County
    var geocoder = new google.maps.Geocoder;
    var infoWindow = new google.maps.InfoWindow;
    var marker = new google.maps.Marker;
  

    //Special Icon to mark current location of user
    var icon ={
      url:"./icons/map-marker-with-a-person-shape.png",
      scaledSize: new google.maps.Size(50,50)
    }

    //Set Facility Markers across Map
    setFacilityMarkers(map);

    //Use Geolocation service to get center
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };

          console.log(pos)
          //Call Reverse Geocoding service
          geocodeLatLng(geocoder, map, infoWindow);

          //Do reverse geocoding and get administrative area of current location
          function geocodeLatLng(geocoder, map, infoWindow){
              geocoder.geocode({'location':pos}, function(results, status){
                console.log(results)
                  if(status === 'OK'){
                      if(results[0]){
                          marker.setIcon(icon);
                          marker.setPosition(pos);
                          marker.setMap(map);
                          infoWindow.setContent('You are at <b>'+results[0].formatted_address+'</b>');
                          infoWindow.setPosition(pos);
                          marker.addListener('click', function(){
                            infoWindow.setContent('You are at <b>'+results[0].formatted_address+'</b>');
                            infoWindow.setPosition(pos);
                            infoWindow.open(map,marker);
                          });
                          
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

          infoWindow.open(map,marker);
          map.setCenter(pos);
          map.setZoom(13);
        }, function() {
          handleLocationError(true, infoWindow, map.getCenter());
        });
      } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
      }
   
    //Get facility location and details, loop through them and plant markers across map
    function setFacilityMarkers(map){
      axios.get('api/facilities').then(function(response){
          $.each(response.data, function(key, value){

            //Get address in lang, lat [parseFloat to convert value from string to float]
            var LatLng = {lat: parseFloat(value.Latitude), lng: parseFloat(value.Longitude)}



            //Get title of marker
            var markerTitle = value.facility;

            //Set facility info
            var facilityInfo='<div><p><b>'+value.facility+'</b></p><p>'+value.Level+', '+value.County+', '+value.Sub_County+'</p></div>';

            //Set marker variable
            var marker = new google.maps.Marker({
                position:LatLng,
                title:markerTitle
            });

            //Add marker to map
            marker.setMap(map);
            marker.addListener('click', function(){
              infoWindow.setContent(facilityInfo);
              infoWindow.setPosition(LatLng);
              infoWindow.open(map, marker);
            })

          })
      }).catch(function(error){

      }).then({

      })
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
        fillColor: '',
        strokeWeight: 0.5,
        strokeColor: 'white'
      });

    
    
  }
