<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Registration_form.WebForm1" %>

<!DOCTYPE html>
<html>
<head>
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

           body, ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }
        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        table {
            margin: auto;
            border: 1px solid white;
            padding: 40px;
           background:rgba(255,255,255,0.5);
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 10px;
        }

        .button {
            border-color: #ccccff;
            background-color: #ccccff;
            color: white;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #a3a3ff;
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
            position: fixed;
            top: 0;
            width: 100%;
            display: block;
            z-index: 100;
            
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
            z-index: 2;
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
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="email"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="password"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" BackColor="White"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button class="button" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" BorderColor="#CCCCFF" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="Incorrect User Credentials" ForeColor="Red"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>

