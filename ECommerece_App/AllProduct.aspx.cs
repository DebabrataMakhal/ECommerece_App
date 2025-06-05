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
    public partial class AllProduct : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn=new SqlConnection(cnf);
            conn.Open();
            if(!IsPostBack)
            {
                FetchAllProduct();
            }
        }
        protected void FetchAllProduct()
        {
            string q = "select * from product";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr= cmd.ExecuteReader();
            DataList1.DataSource= rdr;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string pname, pcat, pic,date,suser;
            double price,total_price;
            int qty;
            if(e.CommandName =="AddToCart")
            {
                string id=e.CommandArgument.ToString();
                string q = " exec FindProductDetailsById '"+id+"'";
                SqlCommand cmd= new SqlCommand(q, conn);
                SqlDataReader rdr= cmd.ExecuteReader();
                rdr.Read();
                if (rdr.HasRows)
                {
                    pname = rdr["pname"].ToString();
                    pcat = rdr["pcat"].ToString();
                    pic = rdr["pic"].ToString();
                    price = double.Parse(rdr["price"].ToString());
                    DropDownList dt =(DropDownList)e.Item.FindControl("DropDownList1");// DROP DOWN LIST ER CONTROL TA ACCESS KORLAM  ..  dt USED KORECHI CARON AKTA OBJECCT HISBA  STORE KORTE HOBE 
                    qty=int.Parse( dt.SelectedValue.ToString());    // DROP DOWN LIST ER VALUE TA FATCH KORLAM 
                    total_price = price * qty;
                    date = DateTime.Now.ToString("yyyy-MM-dd");
                    suser = Session["myuser"].ToString();

                    string qs = " exec AddToCart '"+pname+"','"+pcat+"','"+ total_price + "','"+qty+"','"+pic+"','"+date+"','"+suser+"','"+price+"'";
                    SqlCommand cm= new SqlCommand(qs, conn);
                    cm.ExecuteNonQuery();
                    Response.Redirect("Cart.aspx");

                
                }  
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string q = "select * from product order by price ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataList1.DataSource = rdr;
            DataList1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string q = "select * from product order by price desc ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataList1.DataSource = rdr;
            DataList1.DataBind();
        }
    }
}