using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class StartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void RegisterBUTTON_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainRegister.aspx");
        }
        protected void LogInBUTTON_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApp"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String username = Username.Text;
            String pass = Password.Text;

        

        }

   
    } 
   }
