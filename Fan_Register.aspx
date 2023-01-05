<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan_Register.aspx.cs" Inherits="WebApp.Fan_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            <asp:Label ID="Title" runat="server" Text="Fan
                " style="font-weight: 700; font-size: large"></asp:Label>
            <br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <p>
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        </p>
            National ID Number:&nbsp;&nbsp; <asp:TextBox ID="National_ID_Number" runat="server" ></asp:TextBox>
            <br />
            <br />
            Phone Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Phone_Number" runat="server"></asp:TextBox>
            <br />
            <br />
            Birth Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Birth_Date" runat="server"></asp:TextBox>
            <br />
&nbsp;<br />
            Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Address" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Fan_RegisterBUTTON" runat="server" Text="Register" OnClick="Fan_RegisterBUTTON_Click" style="height: 29px" />
        </p>
            <p>
                <asp:Button ID="BackBUTTON" runat="server" style="margin-right: 0px" Text="Back" Width="90px" OnClick="BackBUTTON_Click" />
        </p>
            <p>
                &nbsp;</p>
        </div>
    </form>
</body>
</html>
