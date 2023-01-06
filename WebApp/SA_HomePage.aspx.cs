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
    public partial class SA_HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddClubBUTTON_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            SqlCommand proc = new SqlCommand("addClub", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@clubName", AddClub_Name.Text));
            proc.Parameters.Add(new SqlParameter("@clubLocation", AddCLub_Location.Text));

            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();
            Response.Write("Club added successfully");

        }

        protected void DeleteClubBUTTON_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            SqlCommand proc = new SqlCommand("deleteClub", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@clubName", DeleteClub_Name.Text));

            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();
            Response.Write("Club deleted successfully, if it existed");

        }

        protected void AddStadiumButton_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(AddStadiumCapacityTextBox.Text, out _))
            {
                Response.Write("Capacity has to be a valid integer");
                return;
            }

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            SqlCommand proc = new SqlCommand("addStadium", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@name", AddStadiumNameTextBox.Text));
            proc.Parameters.Add(new SqlParameter("@location", AddStadiumLocationTextBox.Text));
            proc.Parameters.Add(new SqlParameter("@capacity", int.Parse(AddStadiumCapacityTextBox.Text)));

            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();
            Response.Write("Stadium added successfully");

        }

        protected void DeleteStadiumButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            SqlCommand proc = new SqlCommand("deleteStadium", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@name", DeleteStadiumNameTextBox.Text));

            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();
            Response.Write("Stadium deleted successfully, if it existed");

        }

        protected void BlockFanButton_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(BlockFanNatIDTextBox.Text, out _))
            {
                Response.Write("National ID has to be a valid integer");
                return;
            }

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            SqlCommand proc = new SqlCommand("blockFan", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@id", int.Parse(BlockFanNatIDTextBox.Text)));

            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();
            Response.Write("Fan blocked successfully");
        }
    }
}