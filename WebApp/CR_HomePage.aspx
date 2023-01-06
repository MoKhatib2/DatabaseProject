<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CR_HomePage.aspx.cs" Inherits="WebApp.CR_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <center><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Welcome Club Representative!"></asp:Label></center>        
        <br>
            <div>
            <asp:Label ID="AddMatchLabel1" runat="server" Text="Your Club Info" Font-Bold="True"></asp:Label>
                <asp:Table ID="clubInfoTable" runat="server" Height="139px" Width="410px">
                </asp:Table>
            <br />
            <br />
        </div>
            <div>
            <asp:Label ID="AddMatchLabel2" runat="server" Text="Upcoming Matches" Font-Bold="True"></asp:Label>
                <br />
                <asp:Table ID="upcomingMatchesTable" runat="server" Height="139px" Width="410px">
                </asp:Table>
            <br />
            <br />
        </div>
            <div>
            <asp:Label ID="AddMatchLabel3" runat="server" Text="Available Stadiums" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Datetime"></asp:Label>
                <br />
                <asp:TextBox ID="availableStadiumsTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="viewStadiumsButton" runat="server" Text="View" OnClick="viewStadiumsButton_Click" />
                <br />
                <br />
                <asp:Table ID="availableStadiumsTable" runat="server" Height="139px" Width="410px">
                </asp:Table>
            <br />
            <br />
        </div>
            </form>
</body>
</html>
