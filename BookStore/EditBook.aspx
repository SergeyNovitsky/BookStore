<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="BookStore.EditBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit book</title>
    <script src="Scripts/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: 'EditBook.aspx/GetAuthors',
                method: 'post',
                contentType: 'application/json',
                data: '',
                dataType: 'json',
                success: function (data) {
                    $(data.d).each(function (index, author) {                        
                        $('#selectAuthors').append('<option value="' + author.Id + '">' + author.Name + '</option>');
                    });
                },
                error: function (error) {
                    alert(error);
                }
            });
            $.ajax({
                url: 'EditBook.aspx/GetPublishers',
                method: 'post',
                contentType: 'application/json',
                data: '',
                dataType: 'json',
                success: function (data) {
                    $(data.d).each(function (index, publisher) {
                        $('#selectPublishers').append('<option value="' + publisher.Id + '">' + publisher.Name + '</option>');
                    });
                },
                error: function (error) {
                    alert(error);
                }
            });
            $.ajax({
                url: 'EditBook.aspx/GetGenres',
                method: 'post',
                contentType: 'application/json',
                data: '',
                dataType: 'json',
                success: function (data) {
                    $(data.d).each(function (index, genre) {
                        $('#selectGenres').append('<option value="' + genre.Id + '">' + genre.Name + '</option>');
                    });
                },
                error: function (error) {
                    alert(error);
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnGetBook').click(function () {
                let bookId = $('#txtId').val();

                $.ajax({
                    url: 'EditBook.aspx/GetBookById',
                    method: 'post',
                    contentType: 'application/json',
                    data: '{bookId: ' + bookId + '}',
                    dataType: 'json',
                    success: function (data)
                    {
                        $('#txtName').val(data.d.Name);
                        $('#selectAuthors option[value=' + data.d.Author.Id + ']').prop('selected', true);
                        $('#selectPublishers option[value=' + data.d.Publisher.Id + ']').prop('selected', true);
                        $('#txtPublicationYear').val(data.d.PublicationYear);
                        $('#selectGenres option[value=' + data.d.Genre.Id + ']').prop('selected', true);
                    },
                    error: function (error)
                    {
                        alert(error);
                    }
                });
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnSaveChanges').click(function () {
                $.ajax({
                    url: 'EditBook.aspx/SaveChangesAboutBook',
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        bookId: $('#txtId').val(),
                        bookName: $('#txtName').val(),
                        authorId: $('#selectAuthors').val(),
                        publisherId: $('#selectPublishers').val(),
                        publicationYear: $('#txtPublicationYear').val(),
                        genreId: $('#selectGenres').val()
                    }),
                    dataType: 'json',
                    success: function (data) {
                        alert(data.d);
                    },
                    error: function (error) {
                        alert(error);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        Book Id: 
        <input id="txtId" type="text" />
        <input id="btnGetBook" type="button" value="Get Book" />
        <table>
            <tr>
                <td>Name:</td>
                <td><input id="txtName" type="text" /></td>
            </tr>
            <tr>
                <td>Author:</td>
                <td><select name="Authors" id="selectAuthors"></select></td>
            </tr>
            <tr>
                <td>Publisher:</td>
                <td><select name="Publishers" id="selectPublishers"></select></td>
            </tr>
            <tr>
                <td>Publication year:</td>
                <td><input id="txtPublicationYear" type="text" /></td>
            </tr>
            <tr>
                <td>Genre:</td>
                <td><select name="Genre" id="selectGenres"></select></td>
            </tr>
        </table>
        <input id="btnSaveChanges" type ="button" value="Save changes" />
    </form>
</body>
</html>
