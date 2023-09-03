using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration_form
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;

        }

        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-BG82BNO\SQLEXPRESS;Initial Catalog=booking;Integrated Security=True;"))
            {



                sqlCon.Open();
                string query = "SELECT COUNT(1) FROM vendorregistration WHERE vendor_email=@vendor_email AND vendor_password=@vendor_password";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@vendor_email", vendor_email.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@vendor_password", vendor_password.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());

                if (count == 1)
                {

                    Session["vendor_email1"] = vendor_email.Text.Trim();


                    Response.Redirect("vendor_dashboard.aspx");

                }
                else { lblErrorMessage.Visible = true; }
            }
        }
    }
}