<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userbookings.aspx.cs" Inherits="Registration_form.userbookings" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>User Bookings</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="slot_number" HeaderText="Slot Number" />
        <asp:BoundField DataField="station_name" HeaderText="Station Name" />
        <asp:BoundField DataField="slot_date" HeaderText="Slot Date" />
        <asp:BoundField DataField="slot_start" HeaderText="Slot Start" />
        <asp:BoundField DataField="slot_end" HeaderText="Slot End" />
        <asp:BoundField DataField="slot_status" HeaderText="Slot Status" />

        <asp:TemplateField HeaderText="View Route">
            <ItemTemplate>
                <asp:Button ID="RouteButton" runat="server" Text="View Route" OnClick="RouteButton_Click" CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <HeaderStyle BackColor="#E9E9E9" ForeColor="Black" Font-Bold="True" />
    <RowStyle BackColor="#F0F0F0" ForeColor="Black" />
</asp:GridView>


             <a href="dashboard.aspx" class="button-link">Go to dashboard</a>
        </div>
    </form>
</body>
</html>
