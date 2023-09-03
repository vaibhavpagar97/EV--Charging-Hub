<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Registration_form.Payment" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        /* Style for the larger dropdown */
        #dropdownInput {
            height: 40px; /* Adjust the height as needed */
            font-size: 16px; /* Adjust the font size as needed */
        }
    </style>
    

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Text box for input -->
                         <asp:Label ID="Label1" runat="server" Text="Payment_Mode"></asp:Label>
                         <select id="dropdownInput" runat="server">
                <option value="option1">UPI</option>
                <option value="option2">Paytm</option>
                <option value="option3">debit</option>
            </select>


            <!-- Button to trigger an action -->
            <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
     
            </div>
    </form>
</body>
</html>

