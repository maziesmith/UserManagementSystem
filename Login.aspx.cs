using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InfologUserManagement
{
    public partial class Login : System.Web.UI.Page
    {

        DataSet ds = new DataSet();
        SqlConnection con;
        //Here we declare the parameter which we have to use in our application  
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginHandler(object sender, EventArgs e)
        {
            var sqlconnection = @"Server=localhost\SQLEXPRESS;Database=infolog;Trusted_Connection=True;";
            con = new SqlConnection(sqlconnection);
            cmd = new SqlCommand("selectUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = Username.Text;
            cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password.Text;
            con.Open();
           
            SqlDataReader reader = cmd.ExecuteReader();

      
            if (reader.Read())
            {
                Session["iduser"] = Username.Text;
                Response.Redirect("ListUser.aspx");
            }
            else
            {
             LoginMessage.Text = "Username/password invalid";
             }
            con.Close();
        }
      
    }
}