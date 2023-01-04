using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
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
            DataTable dt = new DataTable();
            DataRow dr;
            String connStr = WebConfigurationManager.ConnectionStrings["WebApp"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String username = Username.Text;
            String pass = Password.Text;

            SqlDataAdapter da = new SqlDataAdapter("select*from SystemUser", conn);
            da.Fill(dt);
            int loggedin = 0;
            for(int i = 0;  i < dt.Rows.Count; i++)
            {
                dr = dt.Rows[i];
                if (Convert.ToString(dr[0]).Equals(username) && Convert.ToString(dr[1]).Equals(pass))
                {
                    loggedin = 1;
                    Session["User"] = Username;

                    break;
                } 
            }

            if(loggedin== 0) { Response.Write("Wrong username or password! please try again"); }
            else
            {
                Response.Write("Logged in");

                DataTable CR_dt = new DataTable();
                SqlDataAdapter CR_da = new SqlDataAdapter("select*from SportsAssManager where username = '" + username + "'", conn);
                CR_da.Fill(CR_dt);
                if (CR_dt.Rows.Count > 0) { Response.Redirect("CR_HomePage.aspx"); }

                DataTable SAM_dt = new DataTable();
                SqlDataAdapter SAM_da = new SqlDataAdapter("select*from SportsAssManager where username = '" + username +"'", conn);
                SAM_da.Fill(SAM_dt);
                if(SAM_dt.Rows.Count > 0) { Response.Redirect("SAM_HomePage.aspx"); }

                DataTable SM_dt = new DataTable();
                SqlDataAdapter SM_da = new SqlDataAdapter("select*from StadiumManager where username = '" + username + "'", conn);
                SM_da.Fill(SM_dt);
                if (SM_dt.Rows.Count > 0) { Response.Redirect("SM_HomePage.aspx"); }

                DataTable FAN_dt = new DataTable();
                SqlDataAdapter FAN_da = new SqlDataAdapter("select*from Fan where username = '" + username + "'", conn);
                FAN_da.Fill(FAN_dt);
                if (FAN_dt.Rows.Count > 0) { Response.Redirect("FAN_HomePage.aspx"); }

                if(SAM_dt.Rows.Count == 0 && SM_dt.Rows.Count == 0 && FAN_dt.Rows.Count == 0) { Response.Redirect("SA_HomePage.aspx"); }

            }
        }


    } 
   }
