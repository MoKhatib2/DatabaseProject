using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApp
{
    public partial class Sports_Association_Manager_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SAM_RegisterBUTTON_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["WebApp"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            DataTable dt = new DataTable();
            DataRow dr;

            String username = Username.Text;
            String pass = Password.Text;
            String name = Name.Text;
        

            bool usernameTaken = false;
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

            if (!usernameTaken)
            {
                SqlCommand addSam = new SqlCommand("addAssociationManager", conn);
                addSam.CommandType = CommandType.StoredProcedure;

                addSam.Parameters.Add(new SqlParameter("@username", username));
                addSam.Parameters.Add(new SqlParameter("@password", pass));
                addSam.Parameters.Add(new SqlParameter("@name", name));

                conn.Open();
                addSam.ExecuteNonQuery();
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