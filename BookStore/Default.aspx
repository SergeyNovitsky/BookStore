<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookStore.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <h3> List of books: </h3>
    <div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource">
            <HeaderTemplate>
            <table class="table">
                <thead class="thread-light">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Publisher</th>
                        <th scope="col">PublicationYear</th>
                        <th scope="col">Genre</th>
                    </tr>
                </thead>
            </HeaderTemplate>
            <ItemTemplate>    
                <tr>
                    <td> <%# Eval("Id") %> </td>
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
