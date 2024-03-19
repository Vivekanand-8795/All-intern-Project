using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BoNamespace;

namespace _3Tier
{
    public partial class _3tier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BLLClass bll = new BLLClass();
            BoClass bo = new BoClass();
            bo.Name=txtName.Text;
            bo.Password=txtPassword.Text;
            bo.UserType=txtUserType.Text;
            bll.Save(bo);
        }
    }
}