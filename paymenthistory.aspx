<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymenthistory.aspx.cs" Inherits="Registration_form.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True">
                <HeaderStyle BackColor="#E9E9E9" ForeColor="Black" Font-Bold="True" />
                <RowStyle BackColor="#F0F0F0" ForeColor="Black" />
            </asp:GridView>

            <p><a href="dashboard.aspx">Go to Dashboard</a></p>
        </div>
    </form>
</body>
</html>
