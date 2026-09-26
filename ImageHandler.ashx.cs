using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;


namespace Jose_Task_Manager
{

    public class ImageHandler : IHttpHandler
    {


        string connectionString =
        @"Data Source=(localdb)\MSSQLLocalDB;
        Initial Catalog=JoseTaskManager;
        Integrated Security=True";




        public void ProcessRequest(HttpContext context)
        {

            int photoID =
            Convert.ToInt32(
                context.Request.QueryString["id"]);




            using (SqlConnection con =
            new SqlConnection(connectionString))
            {


                string sql =
                @"
                SELECT FilePath
                FROM TaskPhotos
                WHERE PhotoID=@id
                ";



                SqlCommand cmd =
                new SqlCommand(sql, con);



                cmd.Parameters.AddWithValue(
                    "@id",
                    photoID);



                con.Open();



                object result =
                cmd.ExecuteScalar();




                if (result != null)
                {

                    string filePath =
                    result.ToString();




                    if (File.Exists(filePath))
                    {


                        string extension =
                        Path.GetExtension(filePath)
                        .ToLower();




                        if (extension == ".png")
                        {

                            context.Response.ContentType =
                            "image/png";

                        }

                        else if (extension == ".jpg" ||
                                 extension == ".jpeg")
                        {

                            context.Response.ContentType =
                            "image/jpeg";

                        }

                        else
                        {

                            context.Response.StatusCode = 400;
                            return;

                        }





                        context.Response.WriteFile(filePath);


                    }

                    else
                    {

                        context.Response.StatusCode = 404;

                    }


                }

                else
                {

                    context.Response.StatusCode = 404;

                }


            }


        }





        public bool IsReusable
        {

            get
            {

                return false;

            }

        }


    }

}