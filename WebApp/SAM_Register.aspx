<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SAM_Register.aspx.cs" Inherits="WebApp.Sports_Association_Manager_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Title" runat="server" Text="Sports Assossiation Manager" style="font-weight: 700"></asp:Label>
            <br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name" runat="server"  Width="163px"></asp:TextBox>
        </div>
        <p>
            Username:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Username" runat="server"  Width="163px"></asp:TextBox>
        </p>
        <p>
            Password:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Passsword" runat="server"  Width="163px"></asp:TextBox>
        </p>
&nbsp;<asp:Button ID="SAM_RegisterBUTTON" runat="server" Text="Register" Width="105px" OnClick="SAM_RegisterBUTTON_Click" />
        <br />
        <br />
        <asp:Button ID="BackBUTTON" runat="server" Text="Back" OnClick="BackBUTTON_Click" />
    </form>
</body>
</html>
