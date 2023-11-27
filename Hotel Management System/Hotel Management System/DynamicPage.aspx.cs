using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Management_System
{
    public partial class DynamicPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static int quantity;
        static string tempquantity, IsActive, price;
        static decimal totalprice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                getData();
            }
        }

        protected void orderButton_Click(object sender, EventArgs e)
        {
            if (checkBookingExist())
            {
                tempquantity = txtChar.Value.ToString().Trim();
                if (tempquantity != "")
                {
                    quantity = int.Parse(txtChar.Value);
                    if (quantity > 0)
                    {
                        placeOrder();
                    }
                    else
                    {
                        Response.Write("<script>alert('Quantity Cannot Be 0');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Quantity Cannot Be Empty');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Room is not occupied/booked by customer');</script>");
            }


        }

        //User defined method
        private void getData()
        {

            try
            {
                string pageName = this.Page.RouteData.Values["PageName"].ToString();
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM product_tbl WHERE [ItemID] = @PageName", con);
                SqlDataAdapter da = new SqlDataAdapter();
                cmd.Parameters.AddWithValue("@PageName", pageName);
                cmd.Connection = con;
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    //Response.Write("<script>alert('" + dt.Rows[0]["RoomType"].ToString() + "');</script>");
                    //                   0       1        2          3         4       5          6             7
                    //product_tbl : ItemID, ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive
                    productNameLabel.Text = dt.Rows[0]["ItemName"].ToString().Trim();
                    detailsLabel.Text = dt.Rows[0]["ItemDetail"].ToString().Trim();
                    price = dt.Rows[0]["Price"].ToString().Trim();
                    IsActive = dt.Rows[0]["IsActive"].ToString().Trim();
                    productImage.ImageUrl = dt.Rows[0]["ItemImage"].ToString();
                    cookieLabel.Text = pageName;
                    productPriceLabel.Text = "RM " + price;
                    breadcrumb.InnerText = productNameLabel.Text;

                    if (IsActive == "False")
                    {
                        orderButton.Enabled = false;
                        orderButton.Text = "Item Unavailable";
                    }
                    else
                    {
                        orderButton.Enabled = true;
                        orderButton.Text = "Order";
                    }

                }
                else
                {
                    Response.Write("<script>alert('Product Does Not Exist');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE RoomNumber='" + roomNumber.Value + "' AND CustomerNo='" + phoneNumber.Value + "' AND B.BookingStatusID ='3'", con); ;
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

        void calculateTotal()
        {
            decimal itemprice = decimal.Parse(price);
            totalprice = itemprice * quantity;
        }

        void placeOrder()
        {
            calculateTotal();
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO order_tbl(ItemID, RoomNumber, ItemName, Quantity, Cost, OrderStatusID) values (@ItemID, @RoomNumber, @ItemName, @Quantity, @Cost, @OrderStatusID)", con);

                cmd.Parameters.AddWithValue("@ItemID", cookieLabel.Text.Trim());
                cmd.Parameters.AddWithValue("@RoomNumber", roomNumber.Value.ToString());
                cmd.Parameters.AddWithValue("@ItemName", productNameLabel.Text.ToString());
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@Cost", totalprice);
                cmd.Parameters.AddWithValue("@OrderStatusID", 1);

                cmd.ExecuteNonQuery();
                con.Close();
                string path = HttpContext.Current.Request.Url.AbsolutePath;
                Response.Write("<script>alert('Order Placed Successfully');window.location='" + path + "';</script>");
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            txtChar.Value = "";
            roomNumber.Value = "";
            phoneNumber.Value = "";
        }
    }
}