<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SAM_HomePage.aspx.cs" Inherits="WebApp.SAM_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <center><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Welcome Sports Association Manager!"></asp:Label></center>        
        <div>
            <br />
            <asp:Label ID="AddMatchLabel" runat="server" Text="Add Match" Font-Bold="True"></asp:Label>
            <br />
            Host Club Name:&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="addMatchHostClubTextBox" runat="server"></asp:TextBox>
            <br />
            Guest Club Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="addMatchGuestClubTextBox" runat="server"></asp:TextBox>
            <br />
            Start Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="addMatchStartTimeTextBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            End Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="addMatchEndTimeTextBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            <asp:Button ID="addMatchButton" runat="server" Text="Add Match" OnClick="addMatchButton_Click" />
            <br />
            <br />
        </div>
        <div>
            <br />
            <asp:Label ID="AddMatchLabel0" runat="server" Text="Delete Match" Font-Bold="True"></asp:Label>
            <br />
            Host Club Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="deleteMatchHostClubTextBox" runat="server"></asp:TextBox>
            <br />
            Guest Club Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="deleteMatchGuestClubTextBox" runat="server"></asp:TextBox>
            <br />
            Start Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="deleteMatchStartTimeTextBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            End Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="deleteMatchEndTimeTextBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            <asp:Button ID="deleteMatchButton" runat="server" Text="Delete Match" OnClick="deleteMatchButton_Click" />
            <br />
            <br />
        </div>
        <br>
            <div>
            <asp:Label ID="AddMatchLabel1" runat="server" Text="All Upcoming Matches" Font-Bold="True"></asp:Label>
                <asp:Table ID="upcomingMatchesTable" runat="server" Height="139px" Width="410px">
                </asp:Table>
            <br />
            <br />
        </div>
            <div>
            <asp:Label ID="AddMatchLabel2" runat="server" Text="Already Played Matches" Font-Bold="True"></asp:Label>
                <asp:Table ID="playedMatchesTable" runat="server" Height="139px" Width="410px">
                </asp:Table>
            <br />
            <br />
        </div>
            <div>
            <asp:Label ID="AddMatchLabel3" runat="server" Text="Pairs Of Clubs That Haven't Played Against Eachother" Font-Bold="True"></asp:Label>
                <asp:Table ID="pairsOfClubsTable" runat="server" Height="139px" Width="410px">
                </asp:Table>
            <br />
            <br />
        </div>
            </form>
</body>
</html>
