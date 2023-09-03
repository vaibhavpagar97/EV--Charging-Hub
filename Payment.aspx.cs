using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_form
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve session variables
                // Retrieve session variables
                string slotNumber = Session["SlotNumber"] as string;

                //string userId = Session["UserId"] as string;
                //string stationName = Session["StationName"] as string;
                //string slotStatus = Session["SlotStatus"] as string;

                // Perform payment processing here
                // ...

                // Update the database with the new status
                //UpdateSlotStatus(slotNumber, userId, stationName);
            }
        }

        // Update the slot status in the database
        private void UpdateSlotStatus(string slotNumber, string userId, string stationName)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;"))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE slots SET user_id = @userId, slot_status = 'booked',payment_stat = 'completed' WHERE slot_number = @slotNumber AND station_name = @stationName";
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@slotNumber", slotNumber);
                cmd.Parameters.AddWithValue("@stationName", stationName);

                cmd.ExecuteNonQuery();
            }
        }


        protected void SubmitButton_Click(object sender, EventArgs e)
        {

            string slotNumber = Session["SlotNumber"] as string;

            string userId = Session["UserId"] as string;
            string stationName = Session["StationName"] as string;

            UpdateSlotStatus(slotNumber, userId, stationName);


            // Insert payment data into Payments table
            InsertPaymentData(userId, slotNumber);



            Response.Redirect("dashboard.aspx");
        }

        private void InsertPaymentData(string userId, string slotNumber)
        {
            // Current date and time
            DateTime currentDateTime = DateTime.Now;

            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;"))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Payment (user_id, slot_number, payment_date, payment_time, payment_status, utr) VALUES (@userId, @slotNumber, @paymentDate, @paymentTime, @paymentStatus, @utr)";
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@slotNumber", slotNumber);
                cmd.Parameters.AddWithValue("@paymentDate", currentDateTime.Date);
                cmd.Parameters.AddWithValue("@paymentTime", currentDateTime.TimeOfDay);
                cmd.Parameters.AddWithValue("@paymentStatus", "Success"); // Set the payment status
                cmd.Parameters.AddWithValue("@utr", "123456"); // Set the UTR number
                cmd.ExecuteNonQuery();
            }
        }
    }
}             