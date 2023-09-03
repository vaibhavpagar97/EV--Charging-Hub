using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_form
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // Check if the user is logged in (session variables exist)
                if (Session["email1"] != null )
                {
                    // Get the email from the session
                    
                    string emailid1 = Session["email1"].ToString();
                    // Fetch user information from the database based on user ID
                    FetchAndDisplayUserInfo(emailid1);
                }
                else
                {
                    // Redirect to the login page if not logged in
                    Response.Redirect("login.aspx");
                }

            }
        }

        private void FetchAndDisplayUserInfo(string emailid1)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "SELECT first_name, last_name, user_id FROM registration WHERE email=@emailid1";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@emailid1", emailid1);
                SqlDataReader reader = sqlCmd.ExecuteReader();

                

                if (reader.HasRows)
                {
                    
                    reader.Read();
                    // Display user information in the page
                    UserNameLiteral.Text = reader["first_name"].ToString() + " " + reader["last_name"].ToString();
                    UserEmailLiteral.Text = emailid1;
                    UserIdLiteral.Text = reader["user_id"].ToString();
                    // You can add more logic to display other user details as needed
                    //to show user value on the bookingmap.aspx do this, now reffer booking.aspx.cs pageload method
                    Session["USERID"] = UserIdLiteral.Text;

                }
                reader.Close();
            }
        }
        protected void searchstationButton_Click(object sender, EventArgs e)
        {
            // Code to execute when the "User Bookings" button is clicked
            Response.Redirect("Payment.aspx"); // Redirect to the User Bookings page
        }



    }
    }
