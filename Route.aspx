<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Route.aspx.cs" Inherits="Registration_form.Route" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Google Maps Example</title>
    <!-- Add the Google Maps API script with callback -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmW05-AxwM5eK5IA09aL9q0LF3TkTYAQw&libraries=places&callback=initMap" async defer></script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Google Map</h1>
        
        <!-- Create a div element for the map -->
        <div id="map" style="height: 400px;"></div>

        <!-- JavaScript code to initialize the map -->
        <script>
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 14
                });

                // Function to get query parameter by name
                function getParameterByName(name) {
                    var url = window.location.href;
                    name = name.replace(/[\[\]]/g, '\\$&');
                    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
                    var results = regex.exec(url);
                    if (!results) return null;
                    if (!results[2]) return '';
                    return decodeURIComponent(results[2].replace(/\+/g, ' '));
                }

                // Get latitude and longitude from query parameters
                var latitude = parseFloat(getParameterByName('latitude'));
                var longitude = parseFloat(getParameterByName('longitude'));

                // Display directions from current location to destination
                var directionsService = new google.maps.DirectionsService();
                var directionsRenderer = new google.maps.DirectionsRenderer({
                    map: map
                });

                // Get user's current location
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(handleGetCurrentPosition);
                }

                // Define a function to handle getting the current location
                function handleGetCurrentPosition(position) {
                    var currentLatLng = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };

                    var userLatLng = {
                        lat: latitude,
                        lng: longitude
                    };

                    var request = {
                        origin: currentLatLng,
                        destination: userLatLng,
                        travelMode: google.maps.TravelMode.DRIVING
                    };

                    directionsService.route(request, function (result, status) {
                        if (status == google.maps.DirectionsStatus.OK) {
                            directionsRenderer.setDirections(result);
                        }
                    });

                    // Set current location as the map center
                    map.setCenter(currentLatLng);
                }
            }
        </script>
    </form>
</body>
</html>
