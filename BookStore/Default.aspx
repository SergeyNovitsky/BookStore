<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookStore.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
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
</asp:Content>
