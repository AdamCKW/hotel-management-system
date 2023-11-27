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
    public partial class Check_InOut : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"]))
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');window.location='/Staff/StaffLogin.aspx';</script>");
                }
                else if (Session["role"].Equals("admin"))
                {
                    adminPanel.Visible = true;
                    revertButton.Enabled = true;
                }
                else
                {
                    adminPanel.Visible = false;
                    revertButton.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }

        protected void idLinkButton_Click(object sender, EventArgs e)
        {
            getDetails();
        }

        protected void getRoomNumberLinkButton_Click(object sender, EventArgs e)
        {
            getFreeRoom();
        }

        protected void checkInButton_Click(object sender, EventArgs e)
        {
            checkIn();
        }

        protected void checkOutButton_Click(object sender, EventArgs e)
        {
            checkOut();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    //Check your condition here
                    DateTime checkIn = Convert.ToDateTime(e.Row.Cells[7].Text);
                    DateTime checkOut = Convert.ToDateTime(e.Row.Cells[8].Text);
                    DateTime today = DateTime.Today;
                    TableCell statusCell = e.Row.Cells[9];
                    string BookingStatus = e.Row.Cells[9].Text;
                    if (today >= checkIn)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleTurquoise;

                        if (BookingStatus == "3")
                        {
                            statusCell.Text = "Occupied";
                            e.Row.BackColor = System.Drawing.Color.PaleGreen;

                            if (today>=checkOut)
                            {
                                e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                            }
                        }

                        

                    }
                    if (today >= checkOut)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }

                    if (BookingStatus == "2")
                    {
                        statusCell.Text = "Reserved";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //User Defined Methods

        void getDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE B.BookingID='" + bookingIDTextBox.Text.Trim()+"'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        customerIDTextBox.Text = dr.GetValue(0).ToString();
                        prefixTextBox.Text = dr.GetValue(1).ToString();
                        lastnameTextBox.Text = dr.GetValue(3).ToString();
                        pnumberTextBox.Text = dr.GetValue(5).ToString();
                        roomNoTextBox.Text = dr.GetValue(17).ToString();
                        string type = dr.GetValue(15).ToString();
                        int typeint = int.Parse(type);
                        roomDropDownList.SelectedIndex = typeint;
                        checkInTextBox.Text = dr.GetValue(21).ToString();
                        checkOutTextBox.Text = dr.GetValue(22).ToString();
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

        void getFreeRoom()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string datein = checkInTextBox.Text;
                string dateout = checkOutTextBox.Text;
                SqlCommand cmd = new SqlCommand("SELECT MIN(RoomNumber) FROM Rooms WHERE RoomTypeID = '" + roomDropDownList.SelectedValue + "' AND IsActive = 'True' AND RoomNumber NOT IN(SELECT RoomNumber FROM booking_tbl B JOIN CustomerDetails RB ON B.CustomerID = RB.CustomerID WHERE RoomTypeID='"+roomDropDownList.SelectedValue+ "' AND BookingStatusID='3' AND ((Check_InDate <= '" + datein+ "' AND Check_OutDate >= '" + datein + "') OR(Check_InDate < '"+dateout+ "' AND Check_OutDate >= '" + dateout + "') OR('" + datein + "' <= Check_InDate  AND '" + dateout + "' >= Check_OutDate)))", con);
                string a = Convert.ToString(cmd.ExecuteScalar());

                roomNoTextBox.Text = a;
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkBookingExistAdmin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE B.BookingID='" + bookingIDTextBox.Text.Trim() + "' AND A.CustomerID='" + customerIDTextBox.Text.Trim() + "';", con);
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

        bool checkBookingExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE B.BookingID='" + bookingIDTextBox.Text.Trim() + "' AND B.BookingStatusID ='2' AND A.CustomerID='" + customerIDTextBox.Text.Trim() + "';", con);
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

        bool checkDates()
        {
            try
            {
                DateTime today = DateTime.Today;
                DateTime indate = Convert.ToDateTime(checkInTextBox.Text);

                if (indate <= today)
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

        bool checkCheckedIn()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE B.BookingID='" + bookingIDTextBox.Text.Trim() + "' AND B.BookingStatusID ='3'  AND A.CustomerID='" + customerIDTextBox.Text.Trim() + "';", con);
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

        void checkIn()
        {
            if (checkBookingExist())
            {
                if (checkDates())
                {
                    getFreeRoom();
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //RoomID, RoomTypeID, RoomNumber, RoomImage, RoomPrice, RoomDescription, AdultCapacity, ChildrenCapacity, BookingStatusID, IsActive
                    SqlCommand cmd = new SqlCommand("UPDATE booking_tbl set RoomNumber=@RoomNumber, BookingStatusID=@BookingStatusID WHERE BookingID='" + bookingIDTextBox.Text.Trim() + "' AND CustomerID='" + customerIDTextBox.Text.Trim() + "' AND BookingStatusID='2' ", con);

                    cmd.Parameters.AddWithValue("@RoomNumber", roomNoTextBox.Text);
                    cmd.Parameters.AddWithValue("@BookingStatusID", 3);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Customer Checked In Successfully');window.location='/Staff/Check InOut.aspx';</script>");
                    clearForm();
                }
                else
                {
                    Response.Write("<script>alert('Check In Date Is Not Today');</script>");
                }
                
            }
            else
            {
                Response.Write("<script>alert('Booking Does Not Exist/Already Checked In');</script>");
            }
        }

        void checkOut()
        {
            if (checkCheckedIn())
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //RoomID, RoomTypeID, RoomNumber, RoomImage, RoomPrice, RoomDescription, AdultCapacity, ChildrenCapacity, BookingStatusID, IsActive
                SqlCommand cmd = new SqlCommand("UPDATE booking_tbl set BookingStatusID=@BookingStatusID Where BookingID='" + bookingIDTextBox.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@BookingStatusID", 1);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("INSERT INTO Housekeeping(RoomNumber, KeepingStatusID) values (@RoomNumber, @KeepingStatusID)", con);
                cmd.Parameters.AddWithValue("@RoomNumber", roomNoTextBox.Text);
                cmd.Parameters.AddWithValue("@KeepingStatusID", 1);
                cmd.ExecuteNonQuery();


                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Customer Checked Out Successfully');window.location='/Staff/Check InOut.aspx';</script>");
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Booking Does Not Exist/Have Not Checked In');</script>");
            }
        }

        void clearForm()
        {
            bookingIDTextBox.Text = "";
            customerIDTextBox.Text = "";
            roomDropDownList.ClearSelection();
            roomNoTextBox.Text = "";
            checkInTextBox.Text = "";
            checkOutTextBox.Text = "";
        }

        protected void revertButton_Click(object sender, EventArgs e)
        {
            revert();
        }

        void revert()
        {
            if (checkBookingExistAdmin())
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //RoomID, RoomTypeID, RoomNumber, RoomImage, RoomPrice, RoomDescription, AdultCapacity, ChildrenCapacity, BookingStatusID, IsActive
                SqlCommand cmd = new SqlCommand("UPDATE booking_tbl set BookingStatusID=@BookingStatusID WHERE BookingID='" + bookingIDTextBox.Text.Trim() + "' AND CustomerID='" + customerIDTextBox.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@BookingStatusID", 2);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Booking Status Reverted');window.location='/Staff/Check InOut.aspx';</script>");
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Booking Does Not Exist');</script>");
            }
        }
    }

    
}