<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="WebApp.StartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong>Log in</strong><br />
            Username</div>
        <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <br />
        Password<br />
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="LogInBUTTON" runat="server" Text="Log in" OnClick="LogInBUTTON_Click" />
        </p>
        <p>
            Not registered? Register here</p>
        <asp:Button ID="RegisterBUTTON" runat="server" OnClick="RegisterBUTTON_Click" Text="Register" />
    </form>
</body>
</html>
