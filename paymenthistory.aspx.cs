using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_form
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Retrieve session variables
                string userId = Session["UserId"] as string;

                if (!string.IsNullOrEmpty(userId))
                {
                    // Query the database to fetch payment history for the user
                    DataTable paymentHistory = FetchPaymentHistory(userId);

                    // Bind the fetched data to a GridView or any other control
                    GridView1.DataSource = paymentHistory;
                    GridView1.DataBind();
                }

            }
        }

        // Method to fetch payment history for a user from the database
        private DataTable FetchPaymentHistory(string userId)
        {
            DataTable paymentHistory = new DataTable();

            // Establish database connection
            string connectionString = @"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Query to fetch payment history data
                string query = "SELECT * FROM Payment WHERE user_id = @userId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);

                    // Execute query and fill the DataTable
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(paymentHistory);
                    }
                }
            }

            return paymentHistory;
        }
    }
}