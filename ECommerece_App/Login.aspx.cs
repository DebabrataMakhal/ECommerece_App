using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerece_App
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf= ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn=new SqlConnection(cnf);
            conn.Open();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string user, email, pass, role="User", profile;

            user=TextBox3.Text;
            email=TextBox4.Text;
            pass=TextBox5.Text;

            FileUpload1.SaveAs(Server.MapPath("Profile/") + Path.GetFileName(FileUpload1.FileName));
            profile = "Profile/" + Path.GetFileName(FileUpload1.FileName);


            string q1 = "exec UserExistProc '" + user + "','" + email + "' ";
            SqlCommand cm=new SqlCommand(q1,conn);
            SqlDataReader rdr= cm.ExecuteReader();
             if(rdr.HasRows)
            {
                Response.Write("<script>alert('User Name or Email Id Already exist');window.location.href='Login.aspx'</script>");
            }
            else
            {
                string q = "exec NewUserAccountProc '" + user + "','" + pass + "','" + role + "','" + email + "','" + profile + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
                clear();
                Response.Write("<script>alert('Registration Successfull !! ');window.location.href='Login.aspx'</script>");
            }

           
        }

        public void clear()
        {
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email, pass;
            email=TextBox1.Text;
            pass=TextBox2.Text;


            string q = "exec UserLoginProc '"+email+"','"+pass+"'";
            SqlCommand cmd= new SqlCommand(q,conn);
            SqlDataReader rdr=cmd.ExecuteReader();
            if(rdr.HasRows)
            {
                while (rdr.Read())
                {
                  
                    if (rdr["acc_email"].Equals(email) && rdr["acc_pass"].Equals(pass) && rdr["acc_role"].Equals("Admin"))
                    {
                        Session["myuser"] = email;
                      Response.Redirect("AddProduct.aspx");
                    }

                    if (rdr["acc_email"].Equals(email) && rdr["acc_pass"].Equals(pass) && rdr["acc_role"].Equals("User"))
                    {
                        Session["myuser"] = email;
                        Response.Redirect("AllProduct.aspx");
                    }
                }

            }
            else
            {            
                    Response.Write("<script>alert('Your Email Id And Password Are Wrong');window.location.href='Login.aspx'</script>");
            }
        }
    }
}