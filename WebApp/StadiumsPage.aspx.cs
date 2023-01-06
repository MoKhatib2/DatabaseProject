using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class StadiumsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            DataTable dataTable = new DataTable();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from viewAvailableStadiumsOn('" + Session["MatchTime"] + "')", conn);
            adapter.Fill(dataTable);

            availableStadiumsTable.Rows.Add(new TableRow());
            for (int j = 0; j < dataTable.Columns.Count; j++)
            {
                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = dataTable.Columns[j].ColumnName;
                availableStadiumsTable.Rows[0].Cells.Add(headerCell);
                availableStadiumsTable.Rows[0].Cells[j].BorderStyle = BorderStyle.Solid;
            }

            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                availableStadiumsTable.Rows.Add(new TableRow());
                for (int j = 0; j < dataTable.Columns.Count; j++)
                {
                    TableCell cell = new TableCell();
                    cell.Text = dataTable.Rows[i][j].ToString();
                    availableStadiumsTable.Rows[i + 1].Cells.Add(cell);
                    availableStadiumsTable.Rows[i + 1].Cells[j].BorderStyle = BorderStyle.Solid;

                }
                Button butt = new Button() { Text = "Request" };
                butt.Click += butt_Click;
                TableCell buttcell = new TableCell();
                buttcell.Controls.Add(butt);
                availableStadiumsTable.Rows[i + 1].Cells.Add(buttcell);
            }
        }

        private void butt_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Butt clicked");
            int rowIndex = ((Table)((Button)sender).Parent.Parent.Parent).Rows.GetRowIndex((TableRow)((Button)sender).Parent.Parent);
            string stadiumName = availableStadiumsTable.Rows[rowIndex].Cells[0].Text;
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            SqlCommand proc = new SqlCommand("addHostRequest", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@clubName", Session["Club"]));
            proc.Parameters.Add(new SqlParameter("@stadiumName", stadiumName));
            proc.Parameters.Add(new SqlParameter("@time", Session["MatchTime"]));

            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("CR_HomePage.aspx");
        }
    }
}