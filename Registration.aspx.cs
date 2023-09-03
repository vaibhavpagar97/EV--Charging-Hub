using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Registration_form
{
    public partial class Registration : System.Web.UI.Page
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
                        SqlDataAdapter sqlDa = new SqlDataAdapter("UserViewByID", sqlCon);
                        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDa.SelectCommand.Parameters.AddWithValue("@user_id", userID);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);

                        
                        //txtuser_id.Text = dtbl.Rows[0][1].ToString();
                        txtfirst_name.Text = dtbl.Rows[0][2].ToString();
                        txtlast_name.Text = dtbl.Rows[0][3].ToString();
                        txtemail.Text = dtbl.Rows[0][4].ToString();
                        txtpassword.Text = dtbl.Rows[0][5].ToString();
                        txtreg_number.Text = dtbl.Rows[0][6].ToString();
                        txtstate.Text = dtbl.Rows[0][7].ToString();
                        txtcity.Text = dtbl.Rows[0][8].ToString();
                        txtpincode.Text = dtbl.Rows[0][9].ToString();
                        
                        txtvehicle_type.Text = dtbl.Rows[0][10].ToString();
                        txtConfirmPassword.Text = dtbl.Rows[0][4].ToString();
                        txtpassword.Attributes.Add("value", dtbl.Rows[0][6].ToString());
                       
                        txtConfirmPassword.Text = dtbl.Rows[0][4].ToString();
                        txtConfirmPassword.Attributes.Add("value", dtbl.Rows[0][4].ToString());
                    }
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtpincode.Text == "" || txtpassword.Text == "")
                lblErrorMessage.Text = "Please Fill Mandatory Fields";
            else if (txtpassword.Text != txtConfirmPassword.Text)
                lblErrorMessage.Text = "Password do not match";
            else
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("UserAdd", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@user_id", Convert.ToInt32(hfUserid.Value == "" ? "0" : hfUserid.Value));
                    sqlCmd.Parameters.AddWithValue("@first_name", txtfirst_name.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@last_name", txtlast_name.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@password", txtpassword.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@reg_number", txtreg_number.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@state", txtstate.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@city", txtcity.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@pincode", txtpincode.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@vehicle_type", txtvehicle_type.Text.Trim());
                    sqlCmd.ExecuteNonQuery();

                    // Retrieve the newly created user ID
                    int newuser_id = GetNewlyCreateduser_id(txtemail.Text.Trim()); // Replace with your method to get the new user ID

                    // Store the new user ID in a session variable
                    Session["user_id1"] = newuser_id;
                   


                    Clear();
                    lblSuccessMessage.Text = "Submitted Successfully";

                    Response.Redirect("login.aspx");
                }
            }

        }

        //get newly created user_id
        private int GetNewlyCreateduser_id(string email)
        {
            int userId = 0;
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;")) 
            {


                sqlCon.Open();
                string query = "SELECT user_id FROM registration WHERE email=@email";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@email", email);
                userId = Convert.ToInt32(sqlCmd.ExecuteScalar());
            }
            return userId;
        }


        void Clear()
        {
            txtfirst_name.Text = txtlast_name.Text = txtemail.Text = txtpassword.Text = txtreg_number.Text = txtpassword.Text = txtConfirmPassword.Text =txtcity.Text=txtstate.Text=txtpincode.Text=txtvehicle_type.Text="";
            hfUserid.Value = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
        }
    }
}      