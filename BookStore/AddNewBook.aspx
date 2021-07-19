<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewBook.aspx.cs" Inherits="BookStore.AddNewBook" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        Add new book:
    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Name" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="BookName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Author" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="Author" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" CssClass="form-select">
        </asp:DropDownList>            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SelectAuthors" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
    <div>
        <asp:Label ID="Label4" runat="server" Text="Publisher" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="Publisher" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id" CssClass="form-select">
        </asp:DropDownList>            
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SelectPublishers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
    <div>
        <asp:Label ID="Label3" runat="server" Text="Publication year" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="PublicationYear" runat="server" CssClass="form-control"></asp:TextBox>            
    </div>
    <div>
        <asp:Label ID="Label5" runat="server" Text="Genres" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="Genres" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id" CssClass="form-select">
        </asp:DropDownList>            
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SelectGenres" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
    <div>
        <asp:Button ID="SaveNewBookButton" class="btn btn-primary" runat="server" Text="Save" OnClick="SaveNewBookButton_Click" />
    </div>
</asp:Content>
