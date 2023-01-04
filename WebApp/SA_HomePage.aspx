<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SA_HomePage.aspx.cs" Inherits="WebApp.SA_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <center><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Welcome System Admin!"></asp:Label></center>        
        <div>
            <br />
            <asp:Label ID="AddClubLabel" runat="server" Text="Add Club" Font-Bold="True"></asp:Label>
            <br />
            Club Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AddClub_Name" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
            Location:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AddCLub_Location" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            <asp:Button ID="AddClubBUTTON" runat="server" Text="Add Club" OnClick="AddClubBUTTON_Click" />
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="DeleteClubLabel" runat="server" Text="Delete Club" Font-Bold="True"></asp:Label>
        
        
            <br />
            Club Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DeleteClub_Name" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;<br />
            
        
            <asp:Button ID="DeleteClubBUTTON" runat="server" Text="Delete Club" OnClick="DeleteClubBUTTON_Click" />
            <br />
            <br />
        </div>
        <div>
        <asp:Label ID="AddStadiumLabel" runat="server" Text="Add Stadium" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="AddStadiumNameLabel" runat="server" Text="Name:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AddStadiumNameTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="AddStadiumLocationLabel" runat="server" Text="Location:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AddStadiumLocationTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="AddStadiumCapacityLabel" runat="server" Text="Capacity:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AddStadiumCapacityTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
            
        
            <asp:Button ID="AddStadiumButton" runat="server" Text="Add Stadium" OnClick="AddStadiumButton_Click" />
            <br />
            <br />
        </div>
        <div>
        <asp:Label ID="AddStadiumLabel0" runat="server" Text="Delete Stadium" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="DeleteStadiumNameLabel" runat="server" Text="Name:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DeleteStadiumNameTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
            
        
            <asp:Button ID="DeleteStadiumButton" runat="server" Text="Delete Stadium" OnClick="DeleteStadiumButton_Click" />
            <br />
            <br />
        </div>
        <div>
        <asp:Label ID="AddStadiumLabel1" runat="server" Text="Block Fan" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="BlockFanNatIDLabel" runat="server" Text="National ID:"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="BlockFanNatIDTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
            
        
            <asp:Button ID="BlockFanButton" runat="server" Text="Block Fan" OnClick="BlockFanButton_Click" />
            <br />
        </div>
            </form>
</body>
</html>
