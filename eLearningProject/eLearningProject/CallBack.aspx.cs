using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLearningProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            foreach (string key in Request.Form.Keys)
            {
                parameters.Add(key.Trim(), Request.Form[key].Trim());
            }

            // Check if the keys exist before accessing them
            if (parameters.ContainsKey("txStatus") && parameters.ContainsKey("paymentMode") && parameters.ContainsKey("orderId"))
            {
                string paymentStatus = parameters["txStatus"];
                string paymode = parameters["paymentMode"];
                string txnId = parameters["orderId"];

                pTxnId.Text = "Transaction Id : " + txnId;
                h1Message.Text = "Your payment is " + paymentStatus;
                pMode.Text = "Payment Mode : " + paymode;
            }
            else
            {
              
            }
        }
        protected void OnNext(object sender, EventArgs e)
        {
           

                if  (h1Message.Text != "Your payment is FAILED")
                {
                    Response.Redirect("Login1.aspx");
                }
                else
                {
                    Response.Redirect("RegistrationForm.aspx");
                }
           
        }
    }
}




//      protected void Page_Load(object sender, EventArgs e)
//      {
//	Dictionary<string, string> parameters = new Dictionary<string, string>();
//	foreach (string key in Request.Form.Keys)
//	{
//		parameters.Add(key.Trim(), Request.Form[key].Trim());
//	}
//	string paymentStatus = parameters["txStatus"];
//	string paymode = parameters["paymentMode"];
//	string txnId = parameters["orderId"];
//	pTxnId.Text = "Transaction Id : " + txnId;
//	h1Message.Text = "Your payment is " + paymentStatus;
//	pMode.Text = "Payment Mode : " + paymode;
//}