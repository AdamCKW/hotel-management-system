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

    public partial class Search_Room : System.Web.UI.Page
    {
        static int count, available, notavailable, adultcheck, childcheck;

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bookNowLinkButton.Visible = false;
                count = 0;
                available = 0;
                notavailable = 0;
                bookNowLinkButton.Enabled = false;
                availableTitle.Visible = false;
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (checkdate())
            {
                displayGridView();
                availableTitle.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Invalid Date');</script>");
            }

        }

        protected void bookNowLinkButton_Click(object sender, EventArgs e)
        {
            Application["dateIn"] = dateInTextBox.Text;
            Application["dateOut"] = dateOutTextBox.Text;
            Application["adult"] = adultCapacity.Value.ToString();
            Application["children"] = childrenCapacity.Value.ToString();
            Application["Chosen Room"] = DropDownList1.SelectedItem.Value;
            Response.Redirect("/Public/Payment/Book Rooms.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "reserve")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                string RoomTypeGrid = (row.FindControl("roomTypeIDLabel") as Label).Text;
                DropDownList1.SelectedValue = DropDownList1.Items.FindByText(RoomTypeGrid).Value;
                goBookingForm();


                // Add code here 
            }
        }

        void goBookingForm()
        {
            Application["dateIn"] = dateInTextBox.Text;
            Application["dateOut"] = dateOutTextBox.Text;
            Application["adult"] = adultCapacity.Value.ToString();
            Application["children"] = childrenCapacity.Value.ToString();
            Application["Chosen Room"] = DropDownList1.SelectedItem.Value;
            Response.Redirect("/Public/Payment/Book Rooms.aspx");
        }

        //user defined methods
        bool checkRoomCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Rooms where RoomTypeID='" + DropDownList1.SelectedItem.Value + "' And IsActive = 'True' ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    count = dt.Rows.Count;
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

        bool checkAvailablitity()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from booking_tbl WHERE RoomTypeID='" + DropDownList1.SelectedItem.Value + "' AND (BookingStatusID='2' OR BookingStatusID='3') AND ((Check_InDate <= '" + dateInTextBox.Text.Trim() + "' AND Check_OutDate >= '" + dateInTextBox.Text.Trim() + "') OR (Check_InDate < '" + dateOutTextBox.Text.Trim() + "' AND Check_OutDate >= '" + dateOutTextBox.Text.Trim() + "') OR ('" + dateInTextBox.Text.Trim() + "' <= Check_InDate  AND '" + dateOutTextBox.Text.Trim() + "' >= Check_OutDate)) ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    notavailable = dt.Rows.Count;
                    return true;
                }
                else
                {
                    notavailable = 0;
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool checkdate()
        {
            try
            {
                DateTime today = DateTime.Today;
                DateTime indate = Convert.ToDateTime(dateInTextBox.Text);
                DateTime outdate = Convert.ToDateTime(dateOutTextBox.Text);

                if (indate != outdate && indate >= today && outdate > today && indate < outdate)
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

        void displayGridView()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                cmd.CommandText = "Select COUNT(RoomID) AS Available, RoomType, RoomPrice, RoomImage From Rooms  WHERE IsActive='True' AND RoomNumber NOT IN (SELECT A.RoomNumber FROM booking_tbl A JOIN Rooms B ON A.RoomTypeID = B.RoomTypeID WHERE ((Check_InDate <= '" + dateInTextBox.Text.Trim() + "' AND Check_OutDate >= '" + dateInTextBox.Text.Trim() + "') OR (Check_InDate < '" + dateOutTextBox.Text.Trim() + "' AND Check_OutDate >= '" + dateOutTextBox.Text.Trim() + "') OR ('" + dateInTextBox.Text.Trim() + "' <= Check_InDate  AND '" + dateOutTextBox.Text.Trim() + "' >= Check_OutDate))) Group By RoomType, RoomPrice, RoomImage";
                cmd.Connection = con;
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }
}