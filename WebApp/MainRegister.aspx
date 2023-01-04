<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainRegister.aspx.cs" Inherits="WebApp.MainRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            Register as:</p>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="52px" Width="205px">
            <asp:ListItem Value="0"> Sports Association Manager</asp:ListItem>
            <asp:ListItem Value="1"> Club Representative</asp:ListItem>
            <asp:ListItem Value="2"> Stadium Manager</asp:ListItem>
            <asp:ListItem Value="3">Fan</asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:Button ID="ContinueBUTTON" runat="server" Text="Continue" Width="93px" OnClick="ContinueBUTTON_Click" />
        </p>
    </form>
</body>
</html>
