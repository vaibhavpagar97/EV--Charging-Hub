using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Registration_form
{
    public partial class addslots : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
            
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {


                       
                            
                            
                                    
                         string stationNameValue = Session["STATIONNAME"].ToString();
                         stationName1.Text = Session["STATIONNAME"].ToString();

                          

                        //string stationNameValue = Session["STATIONNAME"].ToString();
                        // stationName1.Text = stationNameValue;

                        int slot_Id = Convert.ToInt32(Request.QueryString["id"]);
                        // Set the station_name TextBox with the retrieved station name
                       // station_name.Text = stationName1;


                        sqlCon.Open();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("slotview", sqlCon);
                        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDa.SelectCommand.Parameters.AddWithValue("@slot_id", slot_Id);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);


                        //slot_id.Text = dtbl.Rows[0][1].ToString();
                       
                        slot_number.Text = dtbl.Rows[0][1].ToString();

                        slot_date.Text = dtbl.Rows[0][4].ToString();
                        slot_start.Text = dtbl.Rows[0][5].ToString();
                        slot_end.Text = dtbl.Rows[0][6].ToString();
                        latitude.Text = dtbl.Rows[0][8].ToString();
                        longitude.Text = dtbl.Rows[0][9].ToString();
                        stationName1.Text = dtbl.Rows[0][10].ToString();

                    }
                }
            }

        }

        protected void btnAddSlot_Click(object sender, EventArgs e)
        {
           
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("slotadd", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;    

                  string vendorID = Session["VENDORID"].ToString(); // Assuming  the vendor ID in session
                  string slotNumber = vendorID + '_' + slot_number.Text; // Adding vendorID as a prefix
                string pstat = "incomplete";
               //string sn= Session["STATIONNAME"].ToString();

                //hfSlotId it is hidden value
                sqlCmd.Parameters.AddWithValue("@slot_id", Convert.ToInt32(hfSlotId.Value == "" ? "0" : hfSlotId.Value));



                sqlCmd.Parameters.AddWithValue("@slot_number", slotNumber);//prefix as a vendor_id
                sqlCmd.Parameters.AddWithValue("@station_name", stationName1.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@slot_date", slot_date.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@slot_start", slot_start.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@slot_end", slot_end.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@latitude", latitude.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@longitude", longitude.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@vendor_id", vendorID); // Add the vendor ID parameter
                sqlCmd.Parameters.AddWithValue("@payment_stat", pstat); // Add the vendor ID parameter




                sqlCmd.ExecuteNonQuery();

                 

                    Response.Redirect("vendor_dashboard.aspx");
                }
            }

        }

        //get newly created user_id
       


       
}