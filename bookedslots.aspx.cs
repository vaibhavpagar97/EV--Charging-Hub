using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_form
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connectionString = @"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;";

            using (SqlConnection conn = new SqlConnection(connectionString))
                // Check if STATIONNAME session variable exists and is not null/empty
                if (Session["STATIONNAME"] != null && !string.IsNullOrEmpty(Session["STATIONNAME"].ToString()))
                {
                    string stationName = Session["STATIONNAME"].ToString();

                    // Construct the SQL query

                    string query = "SELECT slot_number, station_name, slot_date, slot_start, slot_end, slot_status FROM slots WHERE station_name= @stationName";
                    // string query = "SELECT slot_number, station_name, slot_date, slot_start, slot_end, slot_status ,payment_status FROM payment INNER JOIN slots ON payment.user_id=slots.user_id";
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {


                        cmd.Parameters.AddWithValue("@stationName", stationName);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Bind the data to a GridView or any other control
                            if (reader.HasRows)
                            {
                                // Bind the data to the GridView if there are rows
                                GridViewSlots.DataSource = reader;
                                GridViewSlots.DataBind();
                            }
                            else
                            {
                                // If no rows, display "No data available" message
                                GridViewSlots.EmptyDataText = "No data available";
                                GridViewSlots.DataBind();
                            }



                        }
                    }
                }
        }
    }
}
