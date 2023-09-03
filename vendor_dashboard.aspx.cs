using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_form
{
    public partial class vendor_dashboard : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // Check if the user is logged in (session variables exist)
                if (Session["vendor_email1"] != null)
                {
                    // Get the email from the session

                    string vendoremailid1 = Session["vendor_email1"].ToString();
                    // Fetch user information from the database based on user ID
                    FetchAndDisplayUserInfo(vendoremailid1);
                }
                else
                {
                    // Redirect to the login page if not logged in
                    Response.Redirect("login1.aspx");
                }

            }
        }

        private void FetchAndDisplayUserInfo(string vendoremailid1)
        {
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;"))
            {
                sqlCon.Open();
                string query = "SELECT vendor_name, stationname, vendor_id,  station_state, station_city FROM vendorregistration WHERE vendor_email=@vendoremailid1";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@vendoremailid1", vendoremailid1);
                SqlDataReader reader = sqlCmd.ExecuteReader();



                if (reader.HasRows)
                {

                    reader.Read();
                    // Display user information in the page
                    UserNameLiteral.Text = reader["vendor_name"].ToString();
                    UserEmailLiteral.Text = vendoremailid1;
                    UserstationnameLiteral.Text = reader["stationname"].ToString();
                    UserstateLiteral.Text = reader["station_state"].ToString();
                    UsercityLiteral.Text = reader["station_city"].ToString();
                    UservendoridLiteral.Text = reader["vendor_id"].ToString();
                    // You can add more logic to display other user details as needed
                    //to show user value on the bookingmap.aspx do this, now reffer booking.aspx.cs pageload method
                    Session["VENDORID"] = UservendoridLiteral.Text;
                    Session["STATIONNAME"] = UserstationnameLiteral.Text;

                }
                reader.Close();
            }
        }
        


    }
}