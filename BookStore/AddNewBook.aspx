<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewBook.aspx.cs" Inherits="BookStore.AddNewBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add new book</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add new book:</div>
        <p>            
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="BookName" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Author"></asp:Label>
            <asp:DropDownList ID="Author" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SelectAuthors" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </p>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Publisher"></asp:Label>
            <asp:DropDownList ID="Publisher" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SelectPublishers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Publication year"></asp:Label>
            <asp:TextBox ID="PublicationYear" runat="server"></asp:TextBox>            
        </div>
        <div>
            <asp:Label ID="Label5" runat="server" Text="Genres"></asp:Label>
            <asp:DropDownList ID="Genres" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SelectGenres" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
        <p>
            <asp:Button ID="SaveNewBookButton" runat="server" Text="Save" OnClick="SaveNewBookButton_Click" />
        </p>
    </form>
</body>
</html>
