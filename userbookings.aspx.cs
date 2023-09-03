using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_form
{
    public partial class userbookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["USERID"] != null)
            {
                string userId = Session["USERID"].ToString(); // Retrieve the USERID

                // Call a method to fetch and display user bookings
                FetchAndDisplayUserBookings(userId);
            }
            else
            {
                // Handle the case when the session USERID is not available
            }
            void FetchAndDisplayUserBookings(string userId)
            {
                // Your connection string
                string connectionString = @"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Your SQL query to fetch user bookings
                    string query = "SELECT slot_number, station_name, slot_date, slot_start, slot_end, slot_status FROM slots WHERE user_id = @userId";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Bind the data to a GridView or any other control
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string latitude = DataBinder.Eval(e.Row.DataItem, "latitude").ToString();
                string longitude = DataBinder.Eval(e.Row.DataItem, "longitude").ToString();

                e.Row.Cells[7].Text = "Latitude: " + latitude + "<br />Longitude: " + longitude;

                // Save latitude and longitude in session
                Session["Latitude_" + e.Row.RowIndex] = latitude;
                Session["Longitude_" + e.Row.RowIndex] = longitude;
            }
        }

        protected void RouteButton_Click(object sender, EventArgs e)
        {
            Button routeButton = sender as Button;

            GridViewRow row = (GridViewRow)routeButton.NamingContainer;

            if (row != null)
            {
                int rowIndex = row.RowIndex;

                string latitude = Session["Latitude_" + rowIndex] as string;
                string longitude = Session["Longitude_" + rowIndex] as string;

                // Redirect the user to the route page with latitude and longitude as query parameters
                Response.Redirect($"Route.aspx?latitude={latitude}&longitude={longitude}");
            }
        }
    }
}
  