<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration1.aspx.cs" Inherits="Registration_form.Registration1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h1{
            color:white;
            text-align:center;
            padding-right:385px;
        }/*only for this page, dont copy it*/
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('Home.jpeg');
            background-size: cover; 
            background-repeat: no-repeat; 
            background-color: #f5f5f5;
        }

        
       
       
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 111vh;
            padding-right: 385px; 
           
        }

         .form-table {
            
            margin: auto; /* Center the table horizontally */
            border:rgba(255,255,255,0.5);
            background:rgba(255,255,255,0.5);
            padding:20px;
            border-radius:5px;
            font-weight:bold;
            width:500px;
           height:200px;
         
        }

         #myTextbox{

             width:300px;
             height:50px;
         }

         td{
             width:230px;
             height:50px;
             border:1px;

         }
/*Navbar style*/
  /* Reset default styles */
      
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
 
</style>
</head>
<body>
    <!--nav body start-->
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
        <!--nav body end-->
            <!--nav about start-->
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
    <!--nav about end-->
    <form id="form1" runat="server">
        <div>

           <h1>Vendor Registration</h1>

            </div>


    
    
         <asp:HiddenField ID="hfUserid" runat="server" />
        <div>
            <table class="form-table">
        <tr>
          <th>Field</th>
          <th>Value</th>
        </tr>
       
        <tr>
          <td><asp:Label Text="vendor_name" runat="server" /></td>
          <td><asp:TextBox ID="vendor_name" runat="server" /></td>
        </tr>
        <tr>
          <td><asp:Label Text="vendor_email" runat="server" /></td>
          <td><asp:TextBox ID="vendor_email" runat="server" /></td>
        </tr>
        <tr>
          <td><asp:Label Text="vendor_password" runat="server" /></td>
          <td><asp:TextBox ID="vendor_password" runat="server"  TextMode="Password"/></td>
        </tr>
         <tr>
          <td><asp:Label Text="Confirm Password" runat="server"/></td>
          <td><asp:TextBox ID="txtConfirmPassword" runat="server"  TextMode="Password" /></td>
        </tr>
         <tr>
          <td><asp:Label Text="stationname" runat="server"/></td>
          <td><asp:TextBox ID="stationname" runat="server" /></td>
        </tr>
        
        <tr>
                <td><asp:Label Text="station_state" runat="server"/></td>
          <td><asp:TextBox ID="station_state" runat="server" /></td>
        </tr>
        <tr>
          <td><asp:Label Text="station_pincode" runat="server"/></td>
          <td><asp:TextBox ID="station_pincode" runat="server" /></td>
        </tr>

         <tr>
          <td><asp:Label Text="station_city" runat="server"/></td>
          <td><asp:TextBox ID="station_city" runat="server" /></td>
        </tr>
       
       
        
       
        <tr>
            <td></td>
            <td colspan="3">
               <asp:Button Text="Submit" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
            </td>
        </tr>
        <tr> 
            <td></td>
            <td colspan="2">
                <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" />
            </td>

        </tr>
      </table>
        </div>
    </form>
</body>
</html>
