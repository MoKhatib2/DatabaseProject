<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SM_HomePage.aspx.cs" Inherits="WebApp.SM_HomePage2" %>

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
        &nbsp;<asp:Label ID="Label3" runat="server" Text="Unhandeled Requests:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:GridView ID="Requests" runat="server" CssClass="table"
            width="50%" AutoGenerateColumns="False" DataKeyNames="MatchID" >
            <Columns>
                <asp:BoundField DataField="ClubRepresentative" HeaderText="ClubRepresentative"     />
                <asp:BoundField DataField="HostCLub" HeaderText="HostClub"       />
                <asp:BoundField DataField="GuestClub" HeaderText="GuestClub"     />
                <asp:BoundField DataField="StartTime" HeaderText="StartTime"               />
                <asp:TemplateField HeaderText = "Accept" ItemStyle-HorizontalAlign ="Center" >
                    <ItemTemplate>
                    <asp:Button ID="Accept" runat="server" Text="Accept" 
                       CssClass="btn" 
                        OnClick="AcceptBUTTON_Click"
                     />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText = "Reject" ItemStyle-HorizontalAlign ="Center" >
                    <ItemTemplate>
                    <asp:Button ID="Reject" runat="server" Text="Reject" 
                       CssClass="btn" 
                        OnClick="RejectBUTTON_Click"
                     />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </form>

</body>
</html>

