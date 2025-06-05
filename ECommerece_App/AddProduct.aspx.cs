using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerece_App
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn=new SqlConnection(cnf);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pname, pcat, pic, dt;
            double price;
            pname=TextBox1.Text;
            pcat=DropDownList1.SelectedValue;
            FileUpload1.SaveAs(Server.MapPath("Products/") + Path.GetFileName(FileUpload1.FileName));
            pic= "Products/"+Path.GetFileName(FileUpload1.FileName);
            dt=DateTime.Now.ToString("d/M/yyyy");
            price=double.Parse(TextBox2.Text);

            string q = "exec AddProductProc '"+ pname + "','"+ pcat + "','"+ pic + "','"+ price + "','" + dt + "'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
            clean();
            Response.Write("<script>alert('Product Added Succesfully')</script>");

        }

        public void clean()
        {
            TextBox1.Text = " ";
            TextBox2.Text = " ";
        }
    }
}