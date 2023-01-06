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
    public partial class Fan1 : System.Web.UI.Page
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
            if (!IsPostBack)
                LoadGrid();
        }
        void LoadGrid()
        {
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString()))
            {
                String strSQL = "select m.id as MatchID , host.cname as HostClub, guest.cname as GuestClub, m.StartTime as StartTime \r\n\t\tfrom Match m\r\n\t\tinner join Club host on m.hostClubID = host.id\r\n\t\tinner join Club guest on m.guestClubID = guest.id\r\n\t\tinner join Stadium s on m.stadiumID = s.id\r\n\t\twhere exists (select * from Ticket t where t.matchID = m.id and t.available = 1) and m.startTime >= CURRENT_TIMESTAMP";
                using (SqlCommand cmdSQL = new SqlCommand(strSQL, conn))
                {
                    DataTable rstData = new DataTable();
                    conn.Open();
                    rstData.Load(cmdSQL.ExecuteReader());
                    AvailableTickets.DataSource = rstData;
                    AvailableTickets.DataBind();
                }
            }
        }
      

        protected void ViewMatchesBUTTON_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            DataTable table = new DataTable();

            var startTime = StartTime.Text;

            SqlDataAdapter adapter = new SqlDataAdapter("select host.cname as HostClub, guest.cname as GuestClub, m.StartTime as StartTime \r\n\t\tfrom Match m\r\n\t\tinner join Club host on m.hostClubID = host.id\r\n\t\tinner join Club guest on m.guestClubID = guest.id\r\n\t\tinner join Stadium s on m.stadiumID = s.id\r\n\t\twhere exists (select * from Ticket t where t.matchID = m.id and t.available = 1) and m.startTime >= '" + startTime + "'", conn);
            adapter.Fill(table);
            fillUITable(AvailableMatches, table);
        }
        protected void PurchaseBUTTON_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());
            Button btn = sender as Button;
            GridViewRow gRow = btn.NamingContainer as GridViewRow;
            var hostClub = Convert.ToString(gRow.Cells[0].Text);
            var guestClub = Convert.ToString(gRow.Cells[1].Text);
            var startTime = DateTime.Parse(Convert.ToString(gRow.Cells[2].Text)).ToString("yyyy-MM-dd HH:mm:ss");
            var nationalID = "";
           

            DataTable NationalID_table = new DataTable();
            DataRow dr;
            SqlDataAdapter adapter=  new SqlDataAdapter("select nationalID from Fan where username = '" + Session["User"] + "'", conn);

            adapter.Fill(NationalID_table);
            for (int i = 0; i < NationalID_table.Rows.Count; i++)
            {
                dr = NationalID_table.Rows[i];
                nationalID = Convert.ToString(dr[0]);

            }
            Response.Write(nationalID);

            SqlCommand proc = new SqlCommand("purchaseTicket", conn);
            proc.CommandType = System.Data.CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@nationalID", nationalID));
            proc.Parameters.Add(new SqlParameter("@hostClub", hostClub));
            proc.Parameters.Add(new SqlParameter("@guestClub", guestClub));
            proc.Parameters.Add(new SqlParameter("@startTime", startTime));

            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();

            if (!IsPostBack)
                LoadGrid();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);


        }

        protected void BackBUTTON_Click(object sender, EventArgs e)
        {
            Response.Redirect("StartPage.aspx");
        }
    }
 }

