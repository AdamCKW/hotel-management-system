using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace Hotel_Management_System.Staff
{
    public partial class ReservationPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            cancelReservation();
        }

        protected void idLinkButton_Click(object sender, EventArgs e)
        {
            getBookingData();
        }

        //user defined methods
        void getBookingData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from booking_tbl where BookingID='" + bookingIDTextBox.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        customerIDTextBox.Text = dr.GetValue(4).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Booking ID Does Not Exist');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
}

        bool checkIfBookingExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE B.BookingID='" + bookingIDTextBox.Text.Trim() + "' AND B.CustomerID='" + customerIDTextBox.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void cancelReservation()
        {

            if (checkIfBookingExists())
            {
                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("DELETE from booking_tbl WHERE BookingID='" + bookingIDTextBox.Text.Trim() + "' AND CustomerID='" + customerIDTextBox.Text.Trim() + "'", con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Write("<script>alert('Room Reservation Cancelled Successfully');</script>");
                        GridView1.DataBind();

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
            }
            else
            {
                Response.Write("<script>alert('Booking ID Does Not Exist');</script>");
            }
        }

    }
}