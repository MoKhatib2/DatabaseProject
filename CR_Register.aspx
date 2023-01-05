<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CR_Register.aspx.cs" Inherits="WebApp.CR_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Title" runat="server" Text="Club Representative" style="font-weight: 700"></asp:Label>
            <br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        Username:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <p>
            Password:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        </p>
        Club Name:&nbsp;&nbsp; <asp:TextBox ID="ClubName" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="CR_RegisterBUTTON" runat="server" Text="Register" OnClick="CR_RegisterBUTTON_Click" />
        </p>
        <p>
            <asp:Button ID="BackBUTTON" runat="server" Text="Back" Width="89px" />
        </p>
    </form>
</body>
</html>
