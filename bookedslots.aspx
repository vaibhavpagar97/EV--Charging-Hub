<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookedslots.aspx.cs" Inherits="Registration_form.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

             <div>
            <h1>Slots</h1>
            <asp:GridView ID="GridViewSlots" runat="server" AutoGenerateColumns="true">
            </asp:GridView>
        </div>
        </div>
    </form>
</body>
</html>
