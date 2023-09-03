map
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookingmap.aspx.cs" Inherits="Registration_form.bookingmap" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    

    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('Home.jpeg'); /* Set the background image */
            background-size: cover; /* Ensure the image covers the entire background */
            background-repeat: no-repeat; /* Prevent the image from repeating */
            background-color: #f5f5f5;
        }

      
        /* Reset default styles */
        body, ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        /* Styling the navigation bar */
        .navbar {
            background-color: #000;
            overflow: hidden;
            
        }

            .navbar a {
                float: left;
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

        .dropdown {
            float: left;
            overflow: hidden;
            color:black;
        }

            .dropdown .dropbtn {
                font-size: 16px;
                border: none;
                outline: none;
                color: white;
                padding: 14px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;

            }

            .dropdown .dropbtn1 {
                font-size: 16px;
                border: none;
                outline: none;
                color: black;
                padding: 14px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
            }

            .navbar a:hover, .dropdown:hover .dropbtn {
                background-color: #1cc7c1;
            }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #1cc7c1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            color: black;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /*style for about model*/
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #2fc7858a;
            padding: 20px;
            border-radius: 5vmin;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .close {
            float: right;
            cursor: pointer;
        }

        #map{

        }

        /*grid style*/
        
    .container {
        margin: 20px auto;
        max-width: 800px;
        padding: 20px;
        background-color: #f5f5f5;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        
    }

    .grid-container {
        padding: 20px;
    }

    /* Styling for the GridView */
    .grid-view {
        width: 100%;
        border-collapse: collapse;
    }

    .grid-view th,
    .grid-view td {
        padding: 10px;
        text-align: center;
    }

    .grid-view th {
        background-color: #EFEFEF;
        font-weight: bold;
    }

    .grid-view tr:nth-child(even) {
        background-color: #F7F7DE;
    }

    .grid-view tr:nth-child(odd) {
        background-color: white;
    }

    /* Styling for the "Click to book" button */
    .row-button {
        padding: 5px 10px;
        background-color: #1cc7c1;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .row-button:hover {
        background-color: #159b95;
    }
</style>

       
 
</head>
<div>

    <div class="navbar">
        <a href="Home.html"><strong>Home</strong></a>

        <a href="#news"><strong>News</strong></a>
        <div class="dropdown">
            <button class="dropbtn">
                <strong>User</strong>
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="Registration.aspx">Signup</a>
                <a href="login.aspx">Login</a>

            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">
                <strong>Vendor</strong>
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="Registration1.aspx">Signup</a>
                <a href="login1.aspx">Login</a>

            </div>
        </div>


        <li><a id="aboutBtn" href="#"> <strong>About</strong></a></li>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>
                    About :
                    Welcome to our EV Charging Hub!

                    Our EV Charging Hub is all about making it easy to charge electric cars. We're here to help you power up your vehicle with clean energy. Whether you're driving to work, care about the environment, or just like electric cars, our charging stations are here for you. Let's work together for a greener future by charging your car in a smarter way.
            </div>
        </div>
        </div>
        <script>
            const modal = document.getElementById("myModal");
            const aboutBtn = document.getElementById("aboutBtn");
            const closeBtn = document.getElementsByClassName("close")[0];

            aboutBtn.addEventListener("click", () => {
                modal.style.display = "block";
            });

            closeBtn.addEventListener("click", () => {
                modal.style.display = "none";
            });

            window.addEventListener("click", (event) => {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            });



        </script>

    </div>

<body onload="initMap()">

    <form id="form1" runat="server">
  <asp:HiddenField ID="clickedLocationName" runat="server" />

 
      <div id="map" style="width: 100%; height: 400px;"></div>
              <div id="locationName" style="margin-top: 10px; color:white"></div>

                  <!--<asp:GridView ID="GridView" runat="server"></asp:GridView>-->
                  <!--this grid view contain the rows with will be fetched after user clicks to show available stations-->
  <!--<asp:BoundField DataField="user_id" HeaderText="user_id" />-->
             <div class="container">
    <div class="grid-container">
        
           
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" PageSize="10000">
                      <HeaderStyle BackColor="#EFEFEF" Font-Bold="True" />
    <RowStyle BackColor="#F7F7DE" />
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="slot_number" HeaderText="slot_number" />
        
        <asp:BoundField DataField="user_id" HeaderText="user_id" />
        <asp:BoundField DataField="station_name" HeaderText="station_name" />
        <asp:BoundField DataField="slot_date" HeaderText="slot_date" />
        <asp:BoundField DataField="slot_start" HeaderText="slot_start" />
        <asp:BoundField DataField="slot_end" HeaderText="slot_end" />
        <asp:BoundField DataField="slot_status" HeaderText="slot_status" />
        

        <asp:TemplateField HeaderText="choose slot">
            <ItemTemplate>
                <asp:Button ID="RowButton" runat="server" Text="Click to book" OnClick="RowButton_Click" CommandArgument='<%# Eval("slot_status") %>' />
   

            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

              </div> 
            </div>
      
       <!-- <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" OnClientClick="return runQuery();" /> -->


      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmW05-AxwM5eK5IA09aL9q0LF3TkTYAQw&libraries=places"></script>
      <script>
          var clickedLocationName = ""; // Variable to store the clicked location name
          //here variable get initialize to session USERID
          var userId ="<%= Session["USERID"] %>";
          function initMap() {
              // Initialize the map
              var map = new google.maps.Map(document.getElementById('map'), {
                  center: { lat: 0, lng: 0 },
                  zoom: 15
              });

              // Locations to display
              var locations = [
                  { lat: 12.848483645883512, lng: 77.65716413837582, title: 'stanzahub' },
                  { lat: 12.842425525359197, lng: 77.6607376219465, title: 'lisbonhub' },
                  { lat: 12.8502001, lng: 77.6640906, title: 'Infosys_gt6' },
                  { lat: 12.8417776, lng: 77.6441507, title: 'Neeladri' },
                  { lat: 12.8504436, lng: 77.6769695, title: 'TechMahindra' },
                  { lat: 12.8556334, lng: 77.6637932, title: 'E-city metro station' },
                  { lat: 12.8511200, lng: 77.6526728, title: 'Doddathoguru' },
                  { lat: 12.8240955, lng: 77.6508753, title: 'IHMR' },
                  { lat: 12.8335005, lng: 77.6880926, title: 'kammasandra' },
                  { lat: 12.8433300, lng: 77.6739524, title: 'D-Mart' },
                  { lat: 12.8609805, lng: 77.6649343, title: 'PES university' },
                  { lat: 41.8781, lng: -87.6298, title: 'Chicago' }
                  // Add more locations here
              ];

              // Loop through locations and add markers
              for (var i = 0; i < locations.length; i++) {
                  var marker = new google.maps.Marker({
                      position: locations[i],
                      map: map,
                      title: locations[i].title


                  });

                  // Add click event listener to each marker
                  marker.addListener('click', function () {
                      clickedLocationName = this.getTitle(); // Store the location name
                      //alert('Location: ' + clickedLocationName); // Display the location name
                      document.getElementById('locationName').innerHTML = 'Clicked Location: ' + clickedLocationName; // Display the location name below the map

                  });
              }

              // Try to get user's current location
              if (navigator.geolocation) {
                  navigator.geolocation.getCurrentPosition(function (position) {
                      var userLocation = {
                          lat: position.coords.latitude,
                          lng: position.coords.longitude
                      };

                      // Add a marker for the user's current location
                      var marker = new google.maps.Marker({
                          position: userLocation,
                          map: map,
                          title: 'Your Location'
                      });

                      // Center the map on the user's location
                      map.setCenter(userLocation);
                  });
              }
          }

          function runQuery() {
              //  var clickedLocationName = ""; // Get the clicked location name
              document.getElementById('<%= clickedLocationName.ClientID %>').value = clickedLocationName;
             document.getElementById('<%= Button1.ClientID %>').click();
              return false; // Prevent form submission
          }

          //USERID - show to bookingmap page
          document.addEventListener("DOMContentLoaded", function () {
              // Get the userIdContainer element
              var userIdContainer = document.getElementById('userIdContainer');

              // Set the innerHTML to display the USERID
              userIdContainer.innerHTML = 'USERID: ' + userId;
          });



      </script>
        <h1></h1>
<div>
              <asp:Button ID="Button2" runat="server" Text="Click to show available slots" OnClick="Button1_Click" OnClientClick="return runQuery();" />
      <div id="userIdContainer"  color="white"></div>  <!--USERID will be shown on the page-->
</div>
       <!--<asp:Label ID="userIdLabel1" runat="server" style="position: fixed; bottom: 0; left: 0; z-index: 999;"></asp:Label>-->
        
</form>
                     

    
</body>
</html>

        