using System;
using System.Configuration;
using System.Data.SqlClient;

namespace BookStore
{
    public partial class AddNewBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveNewBookButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                var command = new SqlCommand("AddNewBook", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Name", BookName.Text);
                command.Parameters.AddWithValue("@AuthorId", Int32.Parse(Author.SelectedValue));
                command.Parameters.AddWithValue("@PublisherId", Int32.Parse(Publisher.SelectedValue));
                command.Parameters.AddWithValue("@PublicationYear", Int32.Parse(PublicationYear.Text));
                command.Parameters.AddWithValue("@GenreId", Int32.Parse(Genres.SelectedValue));

                var result = command.ExecuteScalar();
            }
        }
    }
}