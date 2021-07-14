<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewBook.aspx.cs" Inherits="BookStore.AddNewBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add new book:</div>
        <p>            
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="BookNameTextBox" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="SaveNewBookButton" runat="server" Text="Save" OnClick="SaveNewBookButton_Click" />
        </p>
    </form>
</body>
</html>
