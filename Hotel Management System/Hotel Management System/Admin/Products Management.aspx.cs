using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Hotel_Management_System.Admin
{
    public partial class Products_Management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static string itemname, fooddropdown, itemprice;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"]))
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');window.location='/Admin/AdminLogin.aspx';</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            GridView1.DataBind();
        }

        protected void trueLinkButton_Click(object sender, EventArgs e)
        {
            statusTextBox.Text = "True";
        }

        protected void falseLinkButton_Click(object sender, EventArgs e)
        {
            statusTextBox.Text = "False";
        }

        protected void itemIDLinkButton_Click(object sender, EventArgs e)
        {
            getProductData();
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            if (checkTextBox())
            {
                Response.Write("<script>alert('Please Make Sure All Fields Are Filled');</script>");
            }
            else
            {
                addProduct();
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            updateProduct();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            deleteProduct();
        }

        //User defined methods

        //get product data
        void saveProductData()
        {
            itemname = itemNameTextBox.Text.Trim();
            fooddropdown = foodTypeDropDownList.SelectedValue;
            itemprice = priceTextBox.Text.Trim();
        }

        void getProductData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from product_tbl where ItemID='" + itemIDTextBox.Text + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    //Response.Write("<script>alert('" + dt.Rows[0]["RoomType"].ToString() + "');</script>");
                    //                0         1           2         3        4        5           6
                    //product_tbl : ItemID, ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive

                    itemNameTextBox.Text = dt.Rows[0]["ItemName"].ToString().Trim();
                    foodTypeDropDownList.SelectedValue = dt.Rows[0]["ItemTypeID"].ToString().Trim();
                    global_filepath = dt.Rows[0]["ItemImage"].ToString();
                    priceTextBox.Text = dt.Rows[0]["Price"].ToString().Trim();
                    itemDetailTextBox.Text = dt.Rows[0]["ItemDetail"].ToString().Trim();
                    statusTextBox.Text = dt.Rows[0]["IsActive"].ToString().Trim();
                    saveProductData();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Item ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void fetchExistingData()
        {
            if (itemNameTextBox.Text.Trim() == "") 
            {
                itemNameTextBox.Text = itemname;
            }

            if (foodTypeDropDownList.SelectedValue == "0")
            {
                foodTypeDropDownList.SelectedIndex = int.Parse(fooddropdown);
            }

            if (priceTextBox.Text.Trim() == "")
            {
                priceTextBox.Text = itemprice;
            }

            if (itemDetailTextBox.Text.Trim() == "")
            {
                itemDetailTextBox.Text = "NA";
            }
        }

        //Check product exist
        bool checkIfProductExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from product_tbl WHERE ItemID='" + itemIDTextBox.Text.Trim() + "';", con);
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

        //Check text box filled
        bool checkTextBox()
        {
            try
            {

                if (itemNameTextBox.Text == "")
                {
                    return true;
                }
                else if (foodTypeDropDownList.SelectedValue == "0")
                {
                    return true;
                }
                else if (priceTextBox.Text == "")
                {
                    return true;
                }
                else if (itemDetailTextBox.Text == "")
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

        //add product
        void addProduct()
        {
            try
            {
                string filepath = "~/product_img/fast-food.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                decimal tempprice = Convert.ToDecimal(priceTextBox.Text);
                decimal price = Math.Abs(tempprice);

                if (filename != "")
                {
                    FileUpload1.SaveAs(Server.MapPath("/product_img/" + filename));
                    filepath = "~/product_img/" + filename;
                }
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO product_tbl(ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive) values (@ItemName, @ItemTypeID, @ItemImage, @Price, @ItemDetail, @IsActive)", con);

                //product_tbl: ItemID, ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive
                //cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());

                cmd.Parameters.AddWithValue("@ItemName", itemNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@ItemTypeID", foodTypeDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ItemImage", filepath);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@ItemDetail", itemDetailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@IsActive", "True");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Item Added successfully.');window.location='/Admin/Products Management.aspx';</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        //update product details
        void updateProduct()
        {
            
            if (checkIfProductExist())
            {
                try
                {
                    fetchExistingData();

                    string filepath = "~/product_img/fast-food.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("/product_img/" + filename));
                        filepath = "~/product_img/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //product_tbl : ItemID, ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive
                    SqlCommand cmd = new SqlCommand("UPDATE product_tbl set ItemName=@ItemName, ItemTypeID=@ItemTypeID, ItemImage=@ItemImage, Price=@Price, ItemDetail=@ItemDetail, IsActive=@IsActive WHERE ItemID='" + itemIDTextBox.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@ItemName", itemNameTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@ItemTypeID", foodTypeDropDownList.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@ItemImage", filepath);
                    cmd.Parameters.AddWithValue("@Price", priceTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@ItemDetail", itemDetailTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@IsActive", statusTextBox.Text.Trim());


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Item/Product Updated Successfully');window.location='/Admin/Products Management.aspx';</script>");
                    clearForm();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Item ID');</script>");
            }
        }

        //delete product
        //Delete Room
        void deleteProduct()
        {
            if (checkIfProductExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //product_tbl : ItemID, ItemName, ItemTypeID, ItemImage, Price, ItemDetail, IsActive

                    SqlCommand cmd = new SqlCommand("DELETE FROM product_tbl WHERE ItemID='" + itemIDTextBox.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Item Deleted Successfully');window.location='/Admin/Products Management.aspx';</script>");

                    GridView1.DataBind();
                    clearForm();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Item ID');</script>");
            }
        }

        //clearform
        void clearForm()
        {
            itemIDTextBox.Text = "";
            itemNameTextBox.Text = "";
            priceTextBox.Text = "";
            itemDetailTextBox.Text = "";
            statusTextBox.Text = "";
            foodTypeDropDownList.SelectedValue = "0"; ;
        }
    }
}