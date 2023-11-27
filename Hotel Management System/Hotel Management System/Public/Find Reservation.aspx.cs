using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Management_System.Public
{
    public partial class Find_Reservation : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                reservationTitle.Visible = false;
            }
        }

        protected void findButton_Click(object sender, EventArgs e)
        {
            displayGridView();
        }

        //User Defined Methos
        void displayGridView()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string hpnumber = pnumber.Value.ToString();

                cmd.CommandText = "SELECT B.[BookingID], [RoomTypeID], [BookingDate], [Check_InDate], [Check_OutDate], [Night], [TotalAmount] FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE (B.BookingStatusID ='2' OR B.BookingStatusID ='3') AND LastName='" + lastNameTextBox.Text.Trim() + "' AND CustomerNo='" + hpnumber + "'";
                cmd.Connection = con;
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    reservationTitle.Visible = true;
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    TableCell statusCell = e.Row.Cells[1];
                    if (statusCell.Text == "1")
                    {
                        statusCell.Text = "Standard Queen Room";
                    }
                    if (statusCell.Text == "2")
                    {
                        statusCell.Text = "Standard Twin Room";
                    }
                    if (statusCell.Text == "3")
                    {
                        statusCell.Text = "Deluxe Queen Room";
                    }
                    if (statusCell.Text == "4")
                    {
                        statusCell.Text = "Deluxe Twin Room";
                    }
                    if (statusCell.Text == "5")
                    {
                        statusCell.Text = "Suite Room";
                    }
                    if (statusCell.Text == "6")
                    {
                        statusCell.Text = "Family Room";
                    }
                    if (statusCell.Text == "7")
                    {
                        statusCell.Text = "Budget Room";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}