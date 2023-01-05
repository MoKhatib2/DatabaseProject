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
    public partial class SM_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SM_RegisterBUTTON_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApp"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            DataTable dt = new DataTable();
            DataRow dr;

            String username = Username.Text;
            String pass = Password.Text;
            String name = Name.Text;
            String stadiumName = StadiumName.Text;


            bool usernameTaken = false;
            bool StadiumFound = false;
            bool StadiumAvailable = false;

            SqlDataAdapter da = new SqlDataAdapter("select*from SystemUser", conn);
            da.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dr = dt.Rows[i];
                if (dr[0].Equals(username))
                {
                    Response.Write("username already taken!");
                    usernameTaken = true;
                }
            }

            DataTable dt1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter("select*from Stadium", conn);
            da1.Fill(dt1);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                dr = dt1.Rows[i];
                if (dr[1].Equals(StadiumName))
                {
                    StadiumFound = true;
                }
            }

            if (StadiumFound)
            {
                DataTable dt2 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter("select*from Stadium where cname = '" + StadiumName + "'", conn);
                da2.Fill(dt2);
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    dr = dt2.Rows[i];
                    if (dr[1] == null)
                    {
                        StadiumAvailable = true;
                    }
                }
                if (!StadiumAvailable) { Response.Write("Stadium already has a Manager"); }
            }
            else
            {
                Response.Write("Stadium not found");
            }

            if (!usernameTaken && StadiumAvailable)
            {
                SqlCommand addSm = new SqlCommand("addStadiumManager", conn);
                addSm.CommandType = CommandType.StoredProcedure;

                addSm.Parameters.Add(new SqlParameter("@username", username));
                addSm.Parameters.Add(new SqlParameter("@password", pass));
                addSm.Parameters.Add(new SqlParameter("@name", name));
                addSm.Parameters.Add(new SqlParameter("@stadiumName", stadiumName));

                conn.Open();
                addSm.ExecuteNonQuery();
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