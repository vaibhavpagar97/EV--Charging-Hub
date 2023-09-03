using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Registration_form
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;"))
            {


               
                sqlCon.Open();
                string query = "SELECT COUNT(1) FROM registration WHERE email=@email AND password=@password";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@password", txtpassword.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                
                if (count == 1)
                {

                    Session["email1"] = txtemail.Text.Trim();
                   

                    Response.Redirect("dashboard.aspx");

                }
                else { lblErrorMessage.Visible = true; }
            }
        }
    }
}
