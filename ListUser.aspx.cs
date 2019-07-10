using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.IO;


namespace InfologUserManagement
{
    public partial class ListUser : System.Web.UI.Page
    {
        public List<List<string>> UsetCollection;
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();

        ReportDocument crystalReport = new ReportDocument();
         DataTable dt {set;get;}


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                BindGridView(1);

            }
        }

        public void BindGridView(int pageIndex)
        {

            var sqlconnection = @"Server=localhost\SQLEXPRESS;Database=infolog;Trusted_Connection=True;";

            con = new SqlConnection(sqlconnection);
            con.Open();
            cmd = new SqlCommand("UserList", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", int.Parse(ddlPageSize.SelectedValue));
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
            cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);
           this.dt=dt;
            
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
            int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
            this.PopulatePager(recordCount, pageIndex);
        }


        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / decimal.Parse(ddlPageSize.SelectedValue));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("First", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("Last", pageCount.ToString(), currentPage < pageCount));
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }


        protected void PageSize_Changed(object sender, EventArgs e)
        {
            this.BindGridView(1);
        }


        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            this.BindGridView(pageIndex);
        }


        public void AddUser(object sender, EventArgs e)
        {

            ((Button)sender).Text = e.ToString();
            Response.Redirect("Registration.aspx?Command=Save");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Response.Redirect("~/Registration.aspx?ID=" + row.Cells[1].Text + "&Command=Update");
            }
        }
        public void ExportObject(object sender, EventArgs e)
        {
            crystalReport.Load(Server.MapPath("CrystalReport2.rpt"));
            ExportFormatType formatType = ExportFormatType.NoFormat;
            crystalReport.SetDataSource(dt);

            switch (Export.SelectedItem.Text)
            {
                case "Export to PDF":
                    formatType = ExportFormatType.PortableDocFormat;
                    break;
                case "Export to CSV":
                    formatType = ExportFormatType.CharacterSeparatedValues;
                    break;
                case "Export to XLS":
                    formatType = ExportFormatType.Excel;

                    break;
            }
            crystalReport.ExportToHttpResponse(formatType, Response, true, "User");
            Response.End();
        }

    }
}