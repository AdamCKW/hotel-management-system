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
    public partial class RoomCleaning : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void callButton_Click(object sender, EventArgs e)
        {
            if (checkBookingExist())
            {
                if (checkHousekeepingExist())
                {
                    Response.Write("<script>alert('Room Housekeeping Already Requested');</script>");
                    clearForm();
                }
                else
                {
                    requestHousekeeping();
                }
                
            }
            else
            {
                Response.Write("<script>alert('Room is not occupied/booked by customer');</script>");
            }
        }

        //User defined method
        bool checkBookingExist()
        { 
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE RoomNumber='" + roomNumber.Text.Trim() + "' AND CustomerNo='" + phoneNumber.Text.Trim() + "' AND B.BookingStatusID ='3'", con);
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

        bool checkHousekeepingExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Housekeeping WHERE RoomNumber='" + roomNumber.Text.Trim() + "' AND KeepingStatusID='1'", con);
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

        void requestHousekeeping()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Housekeeping(RoomNumber,KeepingStatusID) values (@RoomNumber,@KeepingStatusID)", con);

                cmd.Parameters.AddWithValue("@RoomNumber", roomNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@KeepingStatusID", 1);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Housekeeping Requested Successfully');</script>");
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            roomNumber.Text = "";
            phoneNumber.Text = "";
        }
    }
}