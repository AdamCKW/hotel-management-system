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
    public partial class Order_Page : System.Web.UI.Page
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
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void getButton_Click(object sender, EventArgs e)
        {
            getData();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (checkExist())
            {
                if (checkTextBox())
                {
                    updateOrder();
                }
                else
                {
                    Response.Write("<script>alert('Please Select Order Completion Status');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Order ID');window.location='/Staff/Order Page.aspx';</script>");
            }
            
            
        }

        protected void completeButton_Click(object sender, EventArgs e)
        {
            statusTextBox.Text = "Completed";
        }

        protected void pendingButton_Click(object sender, EventArgs e)
        {
            statusTextBox.Text = "Pending";
        }
        protected void cancelButton_Click(object sender, EventArgs e)
        {
            cancelOrder();
        }

        //user defined methods
        void getData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM order_tbl WHERE OrderID='" + orderIDTextBox.Text.Trim() + "' AND OrderStatusID='1' ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        itemTextBox.Text = dr.GetValue(3).ToString();
                        quantityTextBox.Text = dr.GetValue(4).ToString();
                        totalTextBox.Text = dr.GetValue(5).ToString();
                        string orderstatus = dr.GetValue(6).ToString();
                        roomNoTextBox.Text = dr.GetValue(2).ToString();
                        if (orderstatus == "1")
                        {
                            statusTextBox.Text = "Pending";
                        }
                    }

                }
                else
                {
                    Response.Write("<script>alert('Order ID Does Not Exist');window.location='/Staff/Order Page.aspx';</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateOrder()
        {
            if (checkExist())
            {
                try
                {
                    string today = DateTime.Now.ToString("yyyy-MM-dd");
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //product_tbl : ItemID, ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive
                    SqlCommand cmd = new SqlCommand("UPDATE order_tbl set OrderStatusID=@OrderStatusID, OrderDate=@OrderDate WHERE OrderID='" + orderIDTextBox.Text.Trim() + "' AND RoomNumber='" + roomNoTextBox.Text.Trim() + "' AND OrderStatusID='1'", con);
                    cmd.Parameters.AddWithValue("@OrderStatusID", 2);
                    cmd.Parameters.AddWithValue("@OrderDate", today);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Order Completed');window.location='/Staff/Order Page.aspx';</script>");
                    clearForm();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Order does not exist');</script>");
            }
        }

        bool checkTextBox()
        {
            try
            {
                if (statusTextBox.Text == "Completed")
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

        bool checkExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM order_tbl WHERE OrderID='" + orderIDTextBox.Text.Trim() + "' AND RoomNumber='" + roomNoTextBox.Text.Trim() + "' AND OrderStatusID='1';", con);
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

        void clearForm()
        {
            orderIDTextBox.Text = "";
            statusTextBox.Text = "";
            itemTextBox.Text = "";
            quantityTextBox.Text = "";
            roomNoTextBox.Text = "";
        }

        void cancelOrder()
        {
            if (checkExist())
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //product_tbl : ItemID, ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive
                    SqlCommand cmd = new SqlCommand("DELETE FROM order_tbl WHERE OrderID='" + orderIDTextBox.Text.Trim() + "' AND RoomNumber='" + roomNoTextBox.Text.Trim() + "' AND OrderStatusID='1'", con);

                    cmd.Parameters.AddWithValue("@OrderStatusID", 2);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Order Canceled');window.location='/Staff/Order Page.aspx';</script>");
                    clearForm();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Order ID does Not Exist');window.location='/Staff/Order Page.aspx';</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            TableCell statusCell = e.Row.Cells[6];
            string orderStatus = e.Row.Cells[6].Text;

            if (orderStatus == "1")
            {
                statusCell.Text = "Pending";
            }
        }
    }
}