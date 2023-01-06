using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class CR_HomePage : System.Web.UI.Page
    {
        private void fillUITable(Table uitable, DataTable dataTable)
        {
            uitable.Rows.Add(new TableRow());
            for (int j = 0; j < dataTable.Columns.Count; j++)
            {
                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = dataTable.Columns[j].ColumnName;
                uitable.Rows[0].Cells.Add(headerCell);
                uitable.Rows[0].Cells[j].BorderStyle = BorderStyle.Solid;
            }

            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                uitable.Rows.Add(new TableRow());
                for (int j = 0; j < dataTable.Columns.Count; j++)
                {
                    TableCell cell = new TableCell();
                    cell.Text = dataTable.Rows[i][j].ToString();
                    uitable.Rows[i + 1].Cells.Add(cell);
                    uitable.Rows[i + 1].Cells[j].BorderStyle = BorderStyle.Solid;

                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["User"] = "mohsen";
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            DataTable table = new DataTable();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from RepresentativeClub('" + Session["User"] + "')", conn);
            adapter.Fill(table);
            fillUITable(clubInfoTable, table);

            Session["Club"] = table.Rows[0][0].ToString();

            table = new DataTable();
            adapter = new SqlDataAdapter("select * from otherUpcomingMatchesOfClub('" + Session["Club"] + "')", conn);
            adapter.Fill(table);
            fillUITable(upcomingMatchesTable, table);

            for (int i = 1; i < upcomingMatchesTable.Rows.Count; i++)
            {
                if (upcomingMatchesTable.Rows[i].Cells[0].Text == Session["Club"].ToString() && upcomingMatchesTable.Rows[i].Cells[4].Text == string.Empty)
                {
                    Button butt = new Button();
                    butt.Text = "Choose Stadium";
                    butt.Click += new EventHandler(clickaya);
                    butt.OnClientClick = "return true;";
                    upcomingMatchesTable.Rows[i].Cells.Add(new TableCell());
                    upcomingMatchesTable.Rows[i].Cells[5].Controls.Add(butt);
                }
            }            
        }
        private void clickaya(object sender, EventArgs e)
        {
            int rowIndex = ((Table)((Button)sender).Parent.Parent.Parent).Rows.GetRowIndex((TableRow)((Button)sender).Parent.Parent);
            string datetime = upcomingMatchesTable.Rows[rowIndex].Cells[2].Text;
            string correctdatetime = DateTime.Parse(datetime).ToString("yyyy-MM-dd HH:mm:ss");
            //startTime = date + " " + time;
            Session["MatchTime"] = correctdatetime;
            Response.Redirect("StadiumsPage.aspx");
        }


        protected void viewStadiumsButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            DataTable table = new DataTable();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from viewAvailableStadiumsOn('" + availableStadiumsTextBox.Text + "')", conn);
            adapter.Fill(table);
            fillUITable(availableStadiumsTable, table);
        }
    }
}