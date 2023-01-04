using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class SAM_HomePage : System.Web.UI.Page
    {
        private void fillUITable(Table uitable, DataTable dataTable)
        {
            for (int j = 0; j < dataTable.Columns.Count; j++)
            {
                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = dataTable.Columns[j].ColumnName;
                uitable.Rows.Add(new TableRow());
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
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            DataTable table = new DataTable();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from allUpcomingMatches", conn);
            adapter.Fill(table);
            fillUITable(upcomingMatchesTable, table);

            table = new DataTable();
            adapter = new SqlDataAdapter("select * from playedMatches", conn);
            adapter.Fill(table);
            fillUITable(playedMatchesTable, table);

            table = new DataTable();
            adapter = new SqlDataAdapter("select * from clubsNeverPlayedTogether", conn);
            adapter.Fill(table);
            fillUITable(pairsOfClubsTable, table);
        }

        protected void addMatchButton_Click(object sender, EventArgs e)
        {

        }

        protected void deleteMatchButton_Click(object sender, EventArgs e)
        {

        }
    }
}