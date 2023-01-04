using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class MainRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ContinueBUTTON_Click(object sender, EventArgs e)
        {
            String User = DropDownList1.SelectedValue;

            if (User == "0")
            {
                Response.Redirect("SAM_Register.aspx");
            }
            else if(User == "1") 
            {
                Response.Redirect("CR_Register.aspx");
            }
            else if(User == "2")
            {
                Response.Redirect("SM_Register.aspx");
            }
            else if(User == "3")
            {
                Response.Redirect("Fan_Register.aspx");
            }
        }
    }
}