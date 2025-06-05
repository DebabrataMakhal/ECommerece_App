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
    public partial class UserList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
          conn=new SqlConnection(cnf);
            conn.Open();
            if(!IsPostBack)
            {
                showdata();
            }
        }

        protected void showdata()
        {
            string q = "exec UserListProc ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           Label l1=(Label)GridView1.Rows[e.RowIndex].FindControl("Label4");//ETA KORECHI CARON JEI USER TA DELETE KORBO TAR ID TA NIYE DELTE KORBO
            string id =l1.Text;

            string q = "exec  DeleteAccountById '" + id + "'";
            SqlCommand cmd= new SqlCommand(q, conn);    
            cmd.ExecuteNonQuery();
            showdata();
            Response.Write("<script>alert('User Deleted Succesfully')</Script>");
        }
    }
}