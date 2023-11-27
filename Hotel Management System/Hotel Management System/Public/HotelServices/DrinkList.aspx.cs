using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Management_System.Public.HotelServices
{
    public partial class DrinkList : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                getData();
            }
        }

        private void getData()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("SELECT * FROM product_tbl WHERE ItemTypeID = '2'", con);
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.Connection = con;
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count >= 1)
            {
                rptPages.DataSource = dt;
                rptPages.DataBind();

            }
            else
            {
                Response.Write("<script>alert('Product Does Not Exist');</script>");
            }
        }
    }
}