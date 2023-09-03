<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vendor_dashboard.aspx.cs" Inherits="Registration_form.vendor_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>   </title>
     <style>
        /* Style for the button link */

         .user-info {
           
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
             font-weight: bold;
             background:rgba(255,255,255,0.5);
        }


         .green-button {
            background-color: green;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 10px; /* Adding curved corners */
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2); /* Adding a subtle shadow */
            
        }
        
        .button-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #388e3c;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
        }

      
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
            height: 45px;
            
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
 
    
    </style>
</head>
<body>
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
     <div class="user-info"><h1>Vendor Dashboard</h1></div>
    <form id="form2" runat="server">


           <div>
            <!-- Display user information -->
<!-- Inside your ASPX markup -->
<div class="user-info">
    <p> name :<asp:Literal ID="UserNameLiteral" runat="server" /></p>
    <p> email : <asp:Literal ID="UserEmailLiteral" runat="server" /></p>
    <p> station name: <asp:Literal ID="UserstationnameLiteral" runat="server" /></p>
     <p> state: <asp:Literal ID="UserstateLiteral" runat="server" /></p>
     <p> city: <asp:Literal ID="UsercityLiteral" runat="server" /></p>
    <p> vendor ID: <asp:Literal ID="UservendoridLiteral" runat="server" /></p>

    <!-- You can add more placeholders for other user details as needed -->
</div>

<!-- You can add more Literal controls for other user details if needed -->

        </div>
      

        <div>
    <!-- Button links as buttons -->
   
             
               
              
                  <a href="bookedslots.aspx" class="green-button">Present slots</a>
                  
                  <a href="addslots.aspx" class="green-button">Add slots</a>
             



</div>

     
    </form>
</body>
</html>
