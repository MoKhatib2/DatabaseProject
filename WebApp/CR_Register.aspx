<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CR_Register.aspx.cs" Inherits="WebApp.CR_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        Username:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <p>
            Password:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        </p>
        Club Name:&nbsp;&nbsp; <asp:TextBox ID="CLubName" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="CR_RegisterBUTTON" runat="server" Text="Register" OnClick="CR_RegisterBUTTON_Click" />
        </p>
    </form>
</body>
</html>
