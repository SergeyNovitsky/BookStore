using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using BookStore.Models;

namespace BookStore
{
    public partial class EditBook : System.Web.UI.Page
    {
        private readonly List<Author> authors = new List<Author>();
        private readonly List<Publisher> publishers = new List<Publisher>();
        private readonly List<Genre> genres = new List<Genre>();
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SelectAuthors", connection);
                command.CommandType = CommandType.StoredProcedure;                
                connection.Open();
                SqlDataReader sqlDataReader = command.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    var author = new Author();
                    author.Id = Convert.ToInt32(sqlDataReader["Id"]);
                    author.Name = sqlDataReader["Name"].ToString();
                    authors.Add(author);
                }
                connection.Close();
            }
        }

        [System.Web.Services.WebMethod]
        public static Book GetBookById(int bookId)
        {
            Book book = new Book();
            //string connectionString = ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetBook", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", bookId);
                connection.Open();
                SqlDataReader sqlDataReader = command.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    book.Id = Convert.ToInt32(sqlDataReader["Id"]);
                    book.Name = sqlDataReader["Name"].ToString();
                    //book.Author = new Author { Id = }
                }
            }

            return book;
        }
    }
}