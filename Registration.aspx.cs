using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace InfologUserManagement
{
    public partial class Registration : System.Web.UI.Page
    {

        DataSet ds = new DataSet();
        SqlConnection con;
        //Here we declare the parameter which we have to use in our application  
        SqlCommand cmd = new SqlCommand();
      private static DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Command"].ToString() != "Save")
                {
                    BindTextBoxvalues();
                }
               
            }
        }

        private void BindTextBoxvalues()
        {
            var sqlconnection = @"Server=localhost\SQLEXPRESS;Database=infolog;Trusted_Connection=True;";
            con = new SqlConnection(sqlconnection);
            con.Open();
            cmd = new SqlCommand("SelectByName", con);
            cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Username.Text = dt.Rows[0][1].ToString();
            Firstname.Text = dt.Rows[0][2].ToString();
            Lastname.Text = dt.Rows[0][3].ToString();
            Active.Checked = Convert.ToBoolean(dt.Rows[0][4]);

        }

        public void CancelSave(object sender, EventArgs e)
        {
            Response.Redirect("ListUser.aspx");
        }

        public void SaveUser(object sender, CommandEventArgs e)
        {

            if (Request.QueryString["Command"].ToString() == "Save")
            {
                var sqlconnection = @"Server=localhost\SQLEXPRESS;Database=infolog;Trusted_Connection=True;";
                con = new SqlConnection(sqlconnection);
                cmd = new SqlCommand("InsertUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = Username.Text;
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = Firstname.Text;
                cmd.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = Lastname.Text;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password.Text;
                cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = Active.Checked;
                cmd.Parameters.Add("@LastModifiedBy", SqlDbType.VarChar).Value = "admin";
                cmd.Parameters.Add("@LastModifiedDate", SqlDbType.DateTime).Value = DateTime.Now;
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Redirect("ListUser.aspx");
                }
                con.Close();
            }
            else
            {
                var sqlconnection = @"Server=localhost\SQLEXPRESS;Database=infolog;Trusted_Connection=True;";
                con = new SqlConnection(sqlconnection);
                cmd = new SqlCommand("UpdateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDUser", SqlDbType.UniqueIdentifier).Value = Guid.Parse(dt.Rows[0][0].ToString());
                cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = Username.Text;
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = Firstname.Text;
                cmd.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = Lastname.Text;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password.Text;
                cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = Active.Checked;
                cmd.Parameters.Add("@LastModifiedBy", SqlDbType.VarChar).Value = Session["iduser"].ToString();
                cmd.Parameters.Add("@LastModifiedDate", SqlDbType.DateTime).Value = DateTime.Now;
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Redirect("ListUser.aspx");
                }
                con.Close();
            }
           
        }
    }
}