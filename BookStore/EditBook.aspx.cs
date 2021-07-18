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
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [System.Web.Services.WebMethod]
        public static Book GetBookById(int bookId)
        {
            Book book = new Book();            
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
                    book.Author = new Author { Id = Convert.ToInt32(sqlDataReader["AuthorId"]), Name = sqlDataReader["Author"].ToString() };
                    book.Publisher = new Publisher { Id = Convert.ToInt32(sqlDataReader["PublisherId"]), Name = sqlDataReader["Publisher"].ToString() };
                    book.PublicationYear = Convert.ToInt32(sqlDataReader["PublicationYear"]);
                    book.Genre = new Genre { Id = Convert.ToInt32(sqlDataReader["GenreId"]), Name = sqlDataReader["Genre"].ToString() };
                }
            }

            return book;
        }

        [System.Web.Services.WebMethod]
        public static bool SaveChangesAboutBook(int bookId, string bookName, int authorId, int publisherId, int publicationYear, int genreId)
        {
            bool completedSuccessfully = false;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("UpdateBook", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", bookId);
                command.Parameters.AddWithValue("@Name", bookName);
                command.Parameters.AddWithValue("@AuthorId", authorId);
                command.Parameters.AddWithValue("@PublisherId", publisherId);
                command.Parameters.AddWithValue("@PublicationYear", publicationYear);
                command.Parameters.AddWithValue("@GenreId", genreId);
                connection.Open();
                var result = command.ExecuteNonQuery();
                if (result == 1) completedSuccessfully = true;                
            }

            return completedSuccessfully;
        }

        [System.Web.Services.WebMethod]
        public static List<Author> GetAuthors()
        {
            List<Author> authors = new List<Author>();
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
            return authors;
        }

        [System.Web.Services.WebMethod]
        public static List<Publisher> GetPublishers()
        {
            List<Publisher> publishers = new List<Publisher>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SelectPublishers", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataReader sqlDataReader = command.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    var publisher = new Publisher();
                    publisher.Id = Convert.ToInt32(sqlDataReader["Id"]);
                    publisher.Name = sqlDataReader["Name"].ToString();
                    publishers.Add(publisher);
                }
                connection.Close();
            }
            return publishers;
        }

        [System.Web.Services.WebMethod]
        public static List<Genre> GetGenres()
        {
            List<Genre> genres = new List<Genre>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SelectGenres", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataReader sqlDataReader = command.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    var genre = new Genre();
                    genre.Id = Convert.ToInt32(sqlDataReader["Id"]);
                    genre.Name = sqlDataReader["Name"].ToString();
                    genres.Add(genre);
                }
                connection.Close();
            }
            return genres;
        }
    }
}