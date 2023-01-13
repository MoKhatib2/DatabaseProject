using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace WebApp
{
    public partial class SM_HomePage2 : System.Web.UI.Page
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

            SqlDataAdapter adapter = new SqlDataAdapter("select cr.rname as ClubRepresentative, host.cname as HostClub, guest.cname as GuestClub, m.startTime as StartTime, m.endTime as EndTime, h.approved\r\n        from HostRequest h\r\n        inner join StadiumManager sm on h.stadiumManagerID = sm.id\r\n        inner join ClubRepresentative cr on h.clubRepresentativeID = cr.id\r\n        inner join Match m on h.matchID = m.id\r\n        inner join Club guest on guest.id = m.guestClubID\r\n    inner join Club host on host.id = m.hostClubID  where sm.username = '" + Session["User"] + "'", conn);
            adapter.Fill(table);
            fillUITable(ReceivedRequests, table);

            table = new DataTable();
            adapter = new SqlDataAdapter("select s.id as StadiumID, s.sname as StadiumName, s.available as Available, s.capacity as Capacity, s.slocation as Location from stadium s inner join StadiumManager sm on s.stadiumManagerID = sm.id where sm.username = '" + Session["User"] + "'", conn);
            adapter.Fill(table);
            fillUITable(ManagedStadium, table);

            if (!IsPostBack)
                LoadGrid();
        }

     

        void LoadGrid()
        {
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString()))
            {
                String strSQL = "select m.id as MatchID, cr.rname as ClubRepresentative, host.cname as HostClub, guest.cname as GuestClub, m.startTime as StartTime \r\n        from HostRequest h\r\n        inner join StadiumManager sm on h.stadiumManagerID = sm.id\r\n        inner join ClubRepresentative cr on h.clubRepresentativeID = cr.id\r\n        inner join Match m on h.matchID = m.id\r\n        inner join Club guest on guest.id = m.guestClubID\r\n    inner join Club host on host.id = m.hostClubID  where h.approved is null and sm.username = '" + Session["User"] + "'";
                using (SqlCommand cmdSQL = new SqlCommand(strSQL, conn))
                {
                    DataTable rstData = new DataTable();
                    conn.Open();
                    rstData.Load(cmdSQL.ExecuteReader());
                    Requests.DataSource = rstData;
                    Requests.DataBind();
                }
            }
        }

        protected void AcceptBUTTON_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gRow = btn.NamingContainer as GridViewRow;
            var MatchID = Convert.ToString((int)Requests.DataKeys[gRow.RowIndex]["MatchID"]);

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());

            var StadiumManager = "";
            var HostClub = "";
            var GuestClub = "";
            var StartTime = "";
          
            DataTable table = new DataTable();
            DataRow dr;
            SqlDataAdapter adapter = new SqlDataAdapter("select sm.username as StadiumManager, host.cname as HostClub, guest.cname as GuestClub, m.startTime as StartTime\r\n        from HostRequest h\r\n        inner join StadiumManager sm on h.stadiumManagerID = sm.id\r\n        inner join ClubRepresentative cr on h.clubRepresentativeID = cr.id\r\n        inner join Match m on h.matchID = m.id\r\n        inner join Club guest on guest.id = m.guestClubID\r\n    inner join Club host on host.id = m.hostClubID  where m.id = '" + MatchID + "' and  sm.username = '" + Session["User"] + "'", conn);

            adapter.Fill(table);
            for (int i = 0; i < table.Rows.Count; i++)
            {
                dr = table.Rows[i];
                StadiumManager = Convert.ToString(dr[0]);
                HostClub = Convert.ToString(dr[1]);
                GuestClub = Convert.ToString(dr[2]);
                StartTime = Convert.ToString(dr[3]);

            }

            if (table.Rows.Count > 0)
            {
                SqlCommand proc = new SqlCommand("acceptRequest", conn);
                proc.CommandType = System.Data.CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@stadMUsername", StadiumManager));
                proc.Parameters.Add(new SqlParameter("@hostClub", HostClub));
                proc.Parameters.Add(new SqlParameter("@guestClub", GuestClub));
                proc.Parameters.Add(new SqlParameter("@startTime", DateTime.Parse(StartTime).ToString("yyyy-MM-dd HH:mm:ss")));

                Response.Write("Success?");
                conn.Open();
                proc.ExecuteNonQuery();
                conn.Close();

                if (!IsPostBack)
                    LoadGrid();
            }
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void RejectBUTTON_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gRow = btn.NamingContainer as GridViewRow;
            var MatchID = Convert.ToString((int)Requests.DataKeys[gRow.RowIndex]["MatchID"]);

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["WebApp"].ToString());

            var StadiumManager = "";
            var HostClub = "";
            var GuestClub = "";
            var StartTime = "";

            DataTable table = new DataTable();
            DataRow dr;
            SqlDataAdapter adapter = new SqlDataAdapter("select sm.username as StadiumManager, host.cname as HostClub, guest.cname as GuestClub, m.startTime as StartTime\r\n        from HostRequest h\r\n        inner join StadiumManager sm on h.stadiumManagerID = sm.id\r\n        inner join ClubRepresentative cr on h.clubRepresentativeID = cr.id\r\n        inner join Match m on h.matchID = m.id\r\n        inner join Club guest on guest.id = m.guestClubID\r\n    inner join Club host on host.id = m.hostClubID  where m.id = '" + MatchID + "' and  sm.username = '" + Session["User"] + "'", conn);

            adapter.Fill(table);
            for (int i = 0; i < table.Rows.Count; i++)
            {
                dr = table.Rows[i];
                StadiumManager = Convert.ToString(dr[0]);
                HostClub = Convert.ToString(dr[1]);
                GuestClub = Convert.ToString(dr[2]);
                StartTime = Convert.ToString(dr[3]);

            }

            if (table.Rows.Count > 0)
            {
                SqlCommand proc = new SqlCommand("rejectRequest", conn);
                proc.CommandType = System.Data.CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@stadMUsername", StadiumManager));
                proc.Parameters.Add(new SqlParameter("@hostClub", HostClub));
                proc.Parameters.Add(new SqlParameter("@guestClub", GuestClub));
                proc.Parameters.Add(new SqlParameter("@StartTime", StartTime));

                Response.Write("Success?");
                conn.Open();
                proc.ExecuteNonQuery();
                conn.Close();

                if (!IsPostBack)
                    LoadGrid();
            }
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }



    }
}