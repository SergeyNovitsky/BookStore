using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class AddNewBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveNewBookButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Server=localhost; Database=BookStore; Trusted_Connection=True;";

            using(var connection = new SqlConnection(connectionString))
            {
                string query = "insert into Books (Id, Name) values (2, '" + BookNameTextBox.Text + "')";
                SqlCommand sc = new SqlCommand(query, connection);
                connection.Open();
                int status = sc.ExecuteNonQuery();                
            }
        }
    }
}