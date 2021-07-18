<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="BookStore.EditBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit book</title>
    <script src="Scripts/jquery-3.6.0.js"></script>
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
                        $('#txtAuthor').val(data.d.Author);
                    },
                    error: function (error)
                    {
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
        <input type="button" id="btnGetBook" value="Get Book" />
        <table>
            <tr>
                <td>Name:</td>
                <td><input id="txtName" type="text" /></td>
            </tr>
            <tr>
                <td>Author:</td>
                <td><input id="txtAuthor" type="text" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
