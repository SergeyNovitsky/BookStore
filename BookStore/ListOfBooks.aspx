<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfBooks.aspx.cs" Inherits="BookStore.ListOfBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List of books</title>
</head>
<body>
    <form id="form1" runat="server">
        <h3> List of books: </h3>
        <div>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource">
                <HeaderTemplate>
                <table border="1">
                    <tr>
                        <td><b>Name</b></td>
                        <td><b>Author</b></td>
                        <td><b>Publisher</b></td>
                        <td><b>PublicationYear</b></td>
                        <td><b>Genre</b></td>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>    
                    <tr>
                        <td> <%# Eval("Name") %> </td>
                        <td> <%# Eval("Author") %> </td>
                        <td> <%# Eval("Publisher") %> </td>
                        <td> <%# Eval("PublicationYear") %> </td>
                        <td> <%# Eval("Genre") %> </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SelectAllBooks" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
