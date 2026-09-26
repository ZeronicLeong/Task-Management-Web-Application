using System;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        string username = txtUsername.Text;
        string password = txtPassword.Text;


        string connectionString =
        @"Data Source=(localdb)\MSSQLLocalDB;
        Initial Catalog=JoseTaskManager;
        Integrated Security=True";


        using (SqlConnection con = new SqlConnection(connectionString))
        {

            string sql =
            @"
            SELECT 
                UserID,
                Username,
                Role

            FROM Users

            WHERE Username=@username 
            AND Password=@password
            ";


            SqlCommand cmd =
            new SqlCommand(sql, con);


            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);


            con.Open();


            SqlDataReader reader =
            cmd.ExecuteReader();



            if (reader.Read())
            {

                Session["UserID"] =
                reader["UserID"];


                Session["Username"] =
                reader["Username"].ToString();


                Session["Role"] =
                reader["Role"].ToString();



                if (reader["Role"].ToString() == "Admin")
                {

                    Response.Redirect(
                    "Admin/Dashboard.aspx");

                }
                else
                {

                    Response.Redirect(
                    "User/Tasks.aspx");

                }


            }
            else
            {

                lblMessage.Text =
                "Invalid username or password.";

            }


        }

    }

}