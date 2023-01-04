<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SM_Register.aspx.cs" Inherits="WebApp.SM_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <p>
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        </p>
            Stadium Name:&nbsp;&nbsp; <asp:TextBox ID="StadiumName" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="SM_RegisterBUTTON" runat="server" Text="Register" OnClick="SM_RegisterBUTTON_Click" Height="33px" Width="91px" />
        </p>
        </div>
    </form>
</body>
</html>
