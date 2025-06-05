using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerece_App
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {   
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn=new SqlConnection(cnf);
            conn.Open();

            if (Session["myuser"] != null)
            {
                string user_email = Session["myuser"].ToString();
                string q = "select * from user_account where acc_email='" + user_email + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                string user_name = rdr["acc_user"].ToString();
                Label1.Text = user_name;
            }
            else
            {
                Response.Write("<script>alert('You Need To Login');window.location.href='Login.aspx'</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();//IT WILL DESTROY ALL THE SESSION
            Response.Redirect("Login.aspx");
        }
    }
}