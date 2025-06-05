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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection conn;
        string address, contact;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn=new SqlConnection(cnf);
            conn.Open();
            if(!IsPostBack)
            {
                showproduct();
                GrandTotal();
            }

            address = TextBox3.Text;
            contact = TextBox4.Text;

            Session["address"] = address;
            Session["contact"]=contact;
        }

        protected void showproduct()
        {
            if (Session["myuser"]!=null)
            {
                string name = Session["myuser"].ToString();
                string q = "exec FindCartDeatilsBySession '" + name + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader r = cmd.ExecuteReader();
                GridView1.DataSource = r;
                GridView1.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
           
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
          Label l1=(Label)GridView1.Rows[e.RowIndex].FindControl("Label8");
            string id=l1.Text;

            string q = "exec deleteCartProduct '"+id+"'";
            SqlCommand cm = new SqlCommand(q, conn);
            cm.ExecuteNonQuery();
            showproduct();
            Response.Redirect("Cart.aspx");

        }

        protected void GrandTotal()
        {
            string total_price;
            if (Session["myuser"] != null)
            {
               
                string suser = Session["myuser"].ToString();   
                string q = "select sum(price) as total from cart where suser='"+ suser + "'";
                SqlCommand cmd= new SqlCommand(q, conn);
                SqlDataReader rdr= cmd.ExecuteReader();
                rdr.Read();
                total_price = rdr["total"].ToString();
                Label9.Text = total_price;
                Session["GrandTotal"]=total_price;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["myuser"] != null)
            {
                string address, contact;
                address=TextBox3.Text;
                contact=TextBox4.Text;
                string session_user = Session["myuser"].ToString();
                string q = " insert into placeorder(pname,pcat,price,qty,pic,dt,suser,perprice,address,contact,pstatus) select pname,pcat,price,qty,pic,dt,suser,perprice,'"+address+"','"+contact+"','Not Delivered' from cart where suser='" + session_user + "'";//MULTIPLE QUERY
                SqlCommand c = new SqlCommand(q, conn);
                int row=c.ExecuteNonQuery();
                if (row > 0)
                {
                    string q1 = "delete from cart where suser='" + session_user + "'";
                    SqlCommand cd= new SqlCommand(q1, conn);
                    cd.ExecuteNonQuery();
                    Response.Redirect("PlaceOrder.aspx");
                }
                else
                {
                    Response.Write("<script>alert('something went Wrong')</script>");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

           

        }
    }
}