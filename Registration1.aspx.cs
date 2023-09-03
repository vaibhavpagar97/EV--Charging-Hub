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
    public partial class Registration1 : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int userID = Convert.ToInt32(Request.QueryString["id"]);
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("VendorView", sqlCon);
                        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDa.SelectCommand.Parameters.AddWithValue("@vendor_id", userID);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);


                        //txtuser_id.Text = dtbl.Rows[0][1].ToString();
                        vendor_name.Text = dtbl.Rows[0][2].ToString();
                        vendor_email.Text = dtbl.Rows[0][3].ToString();
                        vendor_password.Text = dtbl.Rows[0][4].ToString();
                        stationname.Text = dtbl.Rows[0][5].ToString();
                        station_state.Text = dtbl.Rows[0][6].ToString();
                        station_pincode.Text = dtbl.Rows[0][7].ToString();
                        station_city.Text = dtbl.Rows[0][8].ToString();



                        txtConfirmPassword.Text = dtbl.Rows[0][4].ToString();
                        vendor_password.Attributes.Add("value", dtbl.Rows[0][6].ToString());

                        txtConfirmPassword.Text = dtbl.Rows[0][4].ToString();
                        txtConfirmPassword.Attributes.Add("value", dtbl.Rows[0][4].ToString());
                    }
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (station_pincode.Text == "" || vendor_password.Text == "")
                lblErrorMessage.Text = "Please Fill Mandatory Fields";
            else if (vendor_password.Text != txtConfirmPassword.Text)
                lblErrorMessage.Text = "Password do not match";
            else
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("VendorAdd", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@vendor_id", Convert.ToInt32(hfUserid.Value == "" ? "0" : hfUserid.Value));
                    sqlCmd.Parameters.AddWithValue("@vendor_name", vendor_name.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@vendor_email", vendor_email.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@vendor_password", vendor_password.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@stationname", stationname.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@station_state", station_state.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@station_pincode", station_pincode.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@station_city", station_city.Text.Trim());
                   
                    sqlCmd.ExecuteNonQuery();

                    // Retrieve the newly created user ID
                    int newuser_id = GetNewlyCreateduser_id(vendor_email.Text.Trim()); // Replace with your method to get the new user ID

                    // Store the new user ID in a session variable
                    Session["vendor_id"] = newuser_id;



                    Clear();
                    lblSuccessMessage.Text = "Submitted Successfully";

                    Response.Redirect("login1.aspx");
                }
            }

        }

        //get newly created vendor_id
        private int GetNewlyCreateduser_id(string vendor_email)
        {
            int vendor_id = 0;
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;"))
            {


                sqlCon.Open();
                string query = "SELECT vendor_id FROM vendorregistration WHERE vendor_email=@vendor_email";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@vendor_email", vendor_email);
                vendor_id = Convert.ToInt32(sqlCmd.ExecuteScalar());
            }
            return vendor_id;
        }


        void Clear()
        {
            vendor_name.Text = vendor_email.Text = vendor_password.Text = stationname.Text = station_state.Text = station_pincode.Text = txtConfirmPassword.Text = station_city.Text = "";
            hfUserid.Value = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
        }
    }
}