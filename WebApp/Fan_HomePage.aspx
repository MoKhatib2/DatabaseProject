<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan_HomePage.aspx.cs" Inherits="WebApp.Fan1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Please enter the time to view the matches with available tickets starting from this time "></asp:Label>
            <br />
            <br />
            &nbsp;<asp:TextBox ID="StartTime" runat="server" style="margin-bottom: 0px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ViewMatchesBUTTON" runat="server" Text="View Matches" OnClick="ViewMatchesBUTTON_Click" />
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
        </div>
        <p>
            <asp:Table ID="AvailableMatches" runat="server" Height="46px" Width="61px">
            </asp:Table>
        </p>
        <p>
            &nbsp;</p>
          <asp:GridView ID="AvailableTickets" runat="server" CssClass="table"
            width="50%" AutoGenerateColumns="False" DataKeyNames="MatchID"  >
            <Columns>
                <asp:BoundField DataField="HostClub" HeaderText="HostClub"       />
                <asp:BoundField DataField="GuestClub" HeaderText="GuestClub"     />
                <asp:BoundField DataField="StartTime" HeaderText="StartTime"               />
                <asp:TemplateField HeaderText = "GetTicket" ItemStyle-HorizontalAlign ="Center" >
                    <ItemTemplate>
                    <asp:Button ID="Purchase" runat="server" Text="Purchase" 
                       CssClass="btn" 
                        OnClick="PurchaseBUTTON_Click"
                     />
                    </ItemTemplate>
                </asp:TemplateField>
                 
            </Columns>
        </asp:GridView>
        <p>
                <asp:Button ID="BackBUTTON" runat="server" style="margin-right: 0px" Text="Back" Width="90px" OnClick="BackBUTTON_Click" />
        </p>
    </form>
</body>
</html>
