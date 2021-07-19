<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="BookStore.EditBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />    
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <title>Edit book</title>    
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
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Default.aspx">List of books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddNewBook.aspx">Add new book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="EditBook.aspx">Edit book by Id</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form runat="server">
        <div class="mb-3">        
            <label for="inputId" class="form-label">Book ID</label>
            <input id="txtId" type="text" class="form-control" />
            <button id="btnGetBook" type="button">Get Book</button>
        </div>
        <div class="mb-3">        
            <label for="inputName" class="form-label">Name</label>
            <input id="txtName" type="text" class="form-control" />            
        </div>
        <div class="mb-3">        
            <label for="selectAuthor" class="form-label">Author</label>
            <select id="selectAuthors" class="form-select" />
        </div>
        <div class="mb-3">        
            <label for="selectPublisher" class="form-label">Publisher</label>
            <select id="selectPublishers" class="form-select" />
        </div>
        <div class="mb-3">        
            <label for="inputPublicationYear" class="form-label">Publication year</label>
            <input id="txtPublicationYear" type="text" class="form-control" />            
        </div>
        <div class="mb-3">        
            <label for="selectGenre" class="form-label">Genre</label>
            <select id="selectGenres" class="form-select" />
        </div>
        <button id="btnSaveChanges" type="button" class="btn btn-primary">Save changes</button>
    </form>
</body>
</html>
