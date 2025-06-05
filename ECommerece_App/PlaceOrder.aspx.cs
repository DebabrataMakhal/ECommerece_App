using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using Razorpay;
using Razorpay.Api;
namespace ECommerece_App
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
           // Button1.Enabled = false;

            if (!IsPostBack)
            {
                FetchOrders();

            }

        }
        protected void FetchOrders()
        {
            string em = Session["myuser"].ToString();
            Label3.Text = "Dm@" + GenerateRandomId();
            Label4.Text = em;
            Label5.Text = Session["contact"].ToString();
            Label8.Text = Session["address"].ToString();
            Label9.Text = Session["GrandTotal"].ToString();
        }

        protected string GenerateRandomId()
        {
            Random random = new Random();
            return random.Next(100, 999).ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=FlipCart.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(sw);
            Panel1.RenderControl(writer);
            StringReader stringReader = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker worker = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            worker.Parse(stringReader);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{

        //    Button1.Enabled = true;
        //    string keyId = "rzp_test_A8o4aMF821lOzs";
        //    string keySecret = "gEUXPxoPXG9kxCvFoCCxAwiO";

        //    RazorpayClient razorpayClient = new RazorpayClient(keyId, keySecret);

        //    double amount = double.Parse(Session["GrandTotal"].ToString());

        //    Dictionary<string, object> options = new Dictionary<string, object>();
        //    options.Add("amount", amount * 100);
        //    options.Add("currency", "INR");
        //    options.Add("receipt", "order_receipt_123");
        //    options.Add("payment_capture", 1);

        //    Razorpay.Api.Order order = razorpayClient.Order.Create(options);
        //    string orderId = order["id"].ToString();
        //    string razorpayScript = $@";

        //    var options = { 
                
        //            'key':'{keyId}',
        //            'amount':{ amount *100},
        //            'currency':'INR',
        //            'name' :'Alexas Private Limited',
        //            'description':'Test Payment',
        //            'order_id':'{orderId}'
        //             'handler':function(response)
        //             {{
        //              alert ('payment Succesfull.Payment ID:'+response.razorpay_pay
        //           }
        //        },

        //    'prefill':
        //        {{
        //         'name':'Debabrata Makhal';
        //         'email':'debabratamakhal@gmail.com';
        //         'contact':'6290580673'
        //          }},

        //    'theme':{{
        //     '     color':'#F37254';
        //        } }

        //        } };

        //    var rzp1 = new Razorpay(options);
        //    rzp1.open();";
        //    ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);

        //}
        

    }

}
