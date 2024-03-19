using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bal;
using Bol;
using Dal;


namespace _3TierCrud
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
           BalClass bll = new BalClass();
            BolClass bo = new BolClass();
            bo.Name = txtName.Text;
            bo.Password = txtPassword.Text;
            bo.UserType = txtUserType.Text;
            bll.Save(bo);
        }
        protected void OnUpdate(object sender, EventArgs e)
        {
            BalClass bll = new BalClass();
            BolClass bo = new BolClass();
            int.TryParse(txtId.Text, out int id);
            bo.Id = id;
            bo.Name = txtName.Text;
            bo.Password = txtPassword.Text;
            bo.UserType = txtUserType.Text;
            bll.Update(bo);
        }
    }
}