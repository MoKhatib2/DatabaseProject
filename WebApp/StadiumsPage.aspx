<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumsPage.aspx.cs" Inherits="WebApp.StadiumsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Available Stadiums"></asp:Label>
            </div>
            <br />
            <br />
            <asp:Table ID="availableStadiumsTable" runat="server">
            </asp:Table>
        </center>
    </form>
</body>
</html>
