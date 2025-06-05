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
    public partial class OrderHistory : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn=new SqlConnection(cnf);
            conn.Open();
            string dt = DateTime.Now.ToString("yyyy-MM-dd");

            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Session["myuser"]!=null)
            {
                GridView1.CssClass = "myclass";
                string from, to;
                from = TextBox1.Text;
                to = TextBox2.Text;

                string q = "select * from placeorder where suser='" +Session["myuser"].ToString() + "' AND dt between '" + from + "' AND '" + to + "' ";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                GridView2.DataSource = rdr;
                GridView2.DataBind();
            }
            
        }
    }
}