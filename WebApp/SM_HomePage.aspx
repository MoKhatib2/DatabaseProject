<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SM_HomePage.aspx.cs" Inherits="WebApp.SM_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Club being Managed"></asp:Label>
        </div>
        <asp:Table ID="ManagedStadium" runat="server" Height="62px" Width="89px">
        </asp:Table>
        <asp:Label ID="Label2" runat="server" Text="Received Requests"></asp:Label>
        <br />
        <asp:Table ID="ReceivedRequests" runat="server" Height="58px" Width="66px">
        </asp:Table>
        <br />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Unhandeled Requests"></asp:Label>
        <br />
        <asp:Table ID="UnhandeledRequests" runat="server" Height="78px" Width="94px">
        </asp:Table>
        <br />
            <asp:Label ID="Label3" runat="server" Text="Please enter match id"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="AcceptOrRejectID" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AcceptBUTTON" runat="server" Text="Accept Request" OnClick="AcceptBUTTON_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="RejectBUTTON" runat="server" Text="Reject Request" OnClick="RejectBUTTON_Click" />
        &nbsp;
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
