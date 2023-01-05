using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class CR_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CR_RegisterBUTTON_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApp"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            DataTable dt = new DataTable();
            DataRow dr;
          
            String username = Username.Text;
            String pass = Password.Text;
            String name = Name.Text;
            String clubName = ClubName.Text;

            bool usernameTaken = false;
            bool clubFound = false;
            bool clubAvailable = false;

            SqlDataAdapter da = new SqlDataAdapter("select*from SystemUser", conn);
            da.Fill(dt);
            for(int i = 0; i<dt.Rows.Count; i++)
            {
                dr = dt.Rows[i];
                if (dr[0].Equals(username)) 
                {
                    Response.Write("username already taken!");
                    usernameTaken = true;
                }
            }

            DataTable dt1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter("select*from Club", conn);
            da1.Fill(dt1);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                dr = dt1.Rows[i];
                if (dr[1].Equals(clubName))
                {
                    clubFound = true;
                }
            }

            if (clubFound) 
            {
                DataTable dt2 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter("select*from Club where cname = '" + clubName +"'", conn);
                da2.Fill(dt2);
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    dr = dt2.Rows[i];
                    if (dr[3] == null)
                    {
                        clubAvailable = true;
                    }
                }
                if (!clubAvailable) { Response.Write("Club already has a representative"); }
            }
            else
            {
                Response.Write("Club not found");
            }

       

            if (!usernameTaken && clubAvailable)
            {
                SqlCommand addCr = new SqlCommand("addRepresentative", conn);
                addCr.CommandType = CommandType.StoredProcedure;

                addCr.Parameters.Add(new SqlParameter("@username", username));
                addCr.Parameters.Add(new SqlParameter("@password", pass));
                addCr.Parameters.Add(new SqlParameter("@name", name));
                addCr.Parameters.Add(new SqlParameter("@clubName", clubName));

                conn.Open();
                addCr.ExecuteNonQuery();
                conn.Close();

                Response.Write("Account Created");
        
            }

        }

        protected void BackBUTTON_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainRegister.aspx");
        }
    }
}