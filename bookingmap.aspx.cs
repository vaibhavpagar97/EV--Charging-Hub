using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace Registration_form
{
    public partial class bookingmap : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;");

        protected void Page_Load1(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                //here the value get retrived from dashboard page, now reffer booking.aspx
                if (Session["USERID"] != null)
                {
                    string userId = Session["USERID"].ToString();
                    ClientScript.RegisterStartupScript(this.GetType(), "SetUserId", $"var userId = '{userId}';", true);

                    // Now you can use the userId as needed on this page
                }

            }


            conn.Open();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string clickedLocationName1 = clickedLocationName.Value; // Retrieve the value
                                                                     // conn.Open();
            disp_data(clickedLocationName1);
            conn.Close();


        }

        public void disp_data(string clickedLocationName)
        {
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select slot_number,user_id,station_name,slot_date,slot_start,slot_end,slot_status from slots where station_name=@clickedLocationName and slot_status IS NULL and user_id IS NULL";

            cmd.Parameters.AddWithValue("@clickedLocationName", clickedLocationName);
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);


            GridView1.DataSource = dt;
            GridView1.DataBind();

        }



        protected void RowButton_Click(object sender, EventArgs e)
        {

            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.Parent.Parent; // Get the row that contains the clicked button

            // Get the values from the row and store them in session variables
            string slotNumber = row.Cells[0].Text;
            // string userId1 = row.Cells[1].Text; // Or use the session USERID
            string stationName = row.Cells[2].Text;
            string slotDate = row.Cells[3].Text;
            string slotStart = row.Cells[4].Text;
            string slotEnd = row.Cells[5].Text;
            string slotStatus = row.Cells[6].Text;

            // Store the values in session variables
            Session["SlotNumber"] = slotNumber;
            Session["UserId"] = Session["USERID"].ToString();
            Session["StationName"] = stationName;
            Session["SlotDate"] = slotDate;
            Session["SlotStart"] = slotStart;
            Session["SlotEnd"] = slotEnd;
            Session["SlotStatus"] = slotStatus;

            // Redirect to the payment page

            Response.Redirect("Payment.aspx");
        }




    }
}