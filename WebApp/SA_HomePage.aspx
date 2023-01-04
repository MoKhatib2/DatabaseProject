<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SA_HomePage.aspx.cs" Inherits="WebApp.SA_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Club Name:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AddClub_Name" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AddCLub_Location" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="AddClubBUTTON" runat="server" Text="Add Club" />
        </div>
        <p>
            Club Name:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DeleteClub_Name" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="DeleteClubBUTTON" runat="server" Text="Delete Club" />
        </p>
    </form>
</body>
</html>
