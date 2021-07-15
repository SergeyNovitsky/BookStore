using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BookStore
{
    public partial class AddNewBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveNewBookButton_Click(object sender, EventArgs e)
        {
            int publicationYear1 = 0;
            if (Int32.TryParse(PublicationYear.Text, out int publicationYear))
                publicationYear1 = publicationYear;
            
            string connectionString = ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;

            using(var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                var command = new SqlCommand("AddNewBook", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                AddSqlParameter<string>(command, "@Name", BookName.Text);
                AddSqlParameter<int>(command, "@AuthorId", Int32.Parse(Author.SelectedValue));
                AddSqlParameter<int>(command, "@PublisherId", Int32.Parse(Publisher.SelectedValue));
                AddSqlParameter<int>(command, "@PublicationYear", publicationYear1);
                AddSqlParameter<int>(command, "@GenreId", Int32.Parse(Genres.SelectedValue));

                var result = command.ExecuteScalar();
            }
        }

        private void AddSqlParameter<T>(SqlCommand command, string parameterName, T value)
        {
            SqlParameter sqlParameter = new SqlParameter
            {
                ParameterName = parameterName,
                Value = value
            };
            command.Parameters.Add(sqlParameter);
        }
    }
}