using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Policy;

namespace WebApp
{
    public partial class Fan_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Fan_RegisterBUTTON_Click(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["WebApp"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            DataTable dt = new DataTable();
            DataRow dr;

            String username = Username.Text;
            String pass = Password.Text;
            String name = Name.Text;
            String NationalID = National_ID_Number.Text;
            String PhoneNumber = Phone_Number.Text;
            String BirthDate = Birth_Date.Text;
            String address = Address.Text;

            bool AlreadyRegisteredNationalID = false;
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

            DataTable dt1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter("select*from Fan", conn);
            da1.Fill(dt1);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dr = dt1.Rows[i];
                if (dr[0].Equals(NationalID))
                {
                    Response.Write("National ID is already registered!");
                    AlreadyRegisteredNationalID = true;
                }
            } 


            if (!usernameTaken && !AlreadyRegisteredNationalID)
            {
                SqlCommand addFan = new SqlCommand("addFan", conn);
                addFan.CommandType = CommandType.StoredProcedure;

                addFan.Parameters.Add(new SqlParameter("@username", username));
                addFan.Parameters.Add(new SqlParameter("@password", pass));
                addFan.Parameters.Add(new SqlParameter("@name", name));
                addFan.Parameters.Add(new SqlParameter("@nationalID", NationalID));
                addFan.Parameters.Add(new SqlParameter("@birthday", BirthDate));
                addFan.Parameters.Add(new SqlParameter("@phone", PhoneNumber));
                addFan.Parameters.Add(new SqlParameter("@address", address));

                conn.Open();
                addFan.ExecuteNonQuery();
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