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
    public partial class Hotel_Room_Management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath, roomtype;

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

        protected void addButton_Click(object sender, EventArgs e)
        {
            if (checkIfRoomExist())
            {
                Response.Write("<script>alert('Room Number Already Exixt, Try Other Room Number');</script>");
            }
            else if (checkTextBox())
            {
                Response.Write("<script>alert('Input Fields Can't Be Empty');</script>");
            }
            else
            {
                addRoom();
            }
            
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            deleteRoom();
        }

        protected void updateAllButton_Click(object sender, EventArgs e)
        {
            if (checkTextBox())
            {
                Response.Write("<script>alert('Input Fields Can't Be Empty');</script>");
            }
            else
            {
                updateRoomType();
            }
        }

        protected void trueLinkButton_Click(object sender, EventArgs e)
        {
            statusTextBox.Text = "True";
        }

        protected void falseLinkButton_Click(object sender, EventArgs e)
        {
            statusTextBox.Text = "False";
        }

        protected void roomIDLinkButton_Click(object sender, EventArgs e)
        {
            getRoomNumberData();
        }

        protected void getRoomDataButton_Click(object sender, EventArgs e)
        {
            getRoomData();
        }

        protected void updateCurrentButton_Click(object sender, EventArgs e)
        {
            if (checkTextBox())
            {
                Response.Write("<script>alert('Input Fields Can't Be Empty');</script>");
            }
            else
            {
                updateRoom();
            }
            
        }


        //User defined method

        //Get Room Type Data
        void getRoomData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from RoomType where RoomTypeID='" + roomTypeList.SelectedValue + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    //Response.Write("<script>alert('" + dt.Rows[0]["RoomType"].ToString() + "');</script>");
                    //0              1             2            3          4           5                6             7
                    //RoomTypeID, RoomType, RoomDescription, RoomRates, Deposit, AdultCapacity, ChildrenCapacity, RoomImage
                    descriptionTextBox.Text = dt.Rows[0]["RoomDescription"].ToString().Trim();
                    priceTextBox.Text = dt.Rows[0]["RoomRates"].ToString().Trim();
                    adultTextBox.Text = dt.Rows[0]["AdultCapacity"].ToString().Trim();
                    childrenTextBox.Text = dt.Rows[0]["ChildrenCapacity"].ToString().Trim();
                    roomtype = dt.Rows[0]["RoomType"].ToString().Trim();
                    global_filepath = dt.Rows[0]["RoomImage"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Please Select Room Type');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkTextBox()
        {
            if(priceTextBox.Text.Trim() == "" || adultTextBox.Text.Trim() == "" || childrenTextBox.Text.Trim() == "" || descriptionTextBox.Text.Trim() == "" || roomTypeList.SelectedItem.Value == "0")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Get Room Number Data()
        void getRoomNumberData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Rooms Where RoomNumber='" + roomNoTextBox.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    //RoomID, RoomTypeID, RoomNumber, RoomImage, RoomPrice, RoomDescription, AdultCapacity, ChildrenCapacity, BookingStatusID, IsActive
                    
                    descriptionTextBox.Text = dt.Rows[0]["RoomDescription"].ToString().Trim();
                    priceTextBox.Text = dt.Rows[0]["RoomPrice"].ToString().Trim();
                    adultTextBox.Text = dt.Rows[0]["AdultCapacity"].ToString().Trim();
                    childrenTextBox.Text = dt.Rows[0]["ChildrenCapacity"].ToString().Trim();
                    global_filepath = dt.Rows[0]["RoomImage"].ToString();
                    statusTextBox.Text = dt.Rows[0]["IsActive"].ToString().Trim();
                    roomTypeList.SelectedValue = dt.Rows[0]["RoomTypeID"].ToString().Trim();
                    roomtype = dt.Rows[0]["RoomType"].ToString().Trim();


                }
                else
                {
                    Response.Write("<script>alert('Invalid Room Number');window.location='/Admin/Hotel Room Management.aspx';</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Add Room
        void addRoom()
        {
            if (roomNoTextBox.Text == "")
            {
                Response.Write("<script>alert('Please Enter The Room Number');</script>");
            }
            else
            {
                if (roomTypeList.SelectedItem.Value == "0")
                {
                    Response.Write("<script>alert('Please Select Room Type Number');</script>");
                }
                else
                {
                    try
                    {

                        string filepath = "~/room_img/room.png";
                        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

                        decimal tempprice = Convert.ToDecimal(priceTextBox.Text);
                        decimal price = Math.Abs(tempprice);


                        if (filename != "")
                        {
                            FileUpload1.SaveAs(Server.MapPath("/room_img/" + filename));
                            filepath = "~/room_img/" + filename;
                        }

                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("INSERT INTO Rooms(RoomTypeID,RoomType,RoomNumber,RoomImage,RoomPrice,RoomDescription,AdultCapacity,ChildrenCapacity,IsActive) values (@RoomTypeID,@RoomType,@RoomNumber,@RoomImage,@RoomPrice,@RoomDescription,@AdultCapacity,@ChildrenCapacity,@IsActive)", con);

                        //RoomID, RoomTypeID, RoomNumber, RoomImage, RoomPrice, RoomDescription, AdultCapacity, ChildrenCapacity, IsActive
                        //cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@RoomTypeID", roomTypeList.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@RoomType", roomtype);
                        cmd.Parameters.AddWithValue("@RoomNumber", roomNoTextBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@RoomImage", filepath);
                        cmd.Parameters.AddWithValue("@RoomPrice", price);
                        cmd.Parameters.AddWithValue("@RoomDescription", descriptionTextBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@AdultCapacity", adultTextBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@ChildrenCapacity", childrenTextBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@IsActive", "TRUE");

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Room Added successfully.');window.location='/Admin/Hotel Room Management.aspx';</script>");
                        GridView1.DataBind();
                        clearForm();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }

            }
        }

        //Check Room Exist
        bool checkIfRoomExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Rooms WHERE RoomNumber='" + roomNoTextBox.Text.Trim() + "';", con);
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

        //update room details
        void updateRoom()
        {
            if (checkIfRoomExist())
            {
                try
                {

                    string filepath = "~/room_img/room.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("/room_img/" + filename));
                        filepath = "~/room_img/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    //RoomID, RoomTypeID, RoomNumber, RoomImage, RoomPrice, RoomDescription, AdultCapacity, ChildrenCapacity, BookingStatusID, IsActive
                    SqlCommand cmd = new SqlCommand("UPDATE Rooms set RoomTypeID=@RoomTypeID, RoomType=@RoomType,RoomImage=@RoomImage, RoomPrice=@RoomPrice, RoomDescription=@RoomDescription, AdultCapacity=@AdultCapacity, ChildrenCapacity=@ChildrenCapacity, IsActive=@IsActive Where RoomNumber='" + roomNoTextBox.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@RoomTypeID", roomTypeList.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@RoomType", roomtype);
                    cmd.Parameters.AddWithValue("@RoomImage", filepath);
                    cmd.Parameters.AddWithValue("@RoomPrice", priceTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@RoomDescription", descriptionTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@AdultCapacity", adultTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@ChildrenCapacity", childrenTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@IsActive", statusTextBox.Text.Trim());


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Room " + roomNoTextBox.Text.Trim() + " Updated Successfully');window.location='/Admin/Hotel Room Management.aspx';</script>");
                    clearForm();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Room Number');</script>");
            }
        }

        //Update Room Type Data
        void updateRoomType()
        {
            try
            {

                string filepath = "~/room_img/room.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;

                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("/room_img/" + filename));
                    filepath = "~/room_img/" + filename;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //RoomTypeID, RoomType, RoomDescription, RoomRates, AdultCapacity, ChildrenCapacity, RoomImage
                SqlCommand cmd = new SqlCommand("UPDATE RoomType SET RoomDescription=@RoomDescription, RoomRates=@RoomRates, AdultCapacity=@AdultCapacity, ChildrenCapacity=@ChildrenCapacity, RoomImage=@RoomImage WHERE RoomTypeID='" + roomTypeList.SelectedValue + "'", con);

                cmd.Parameters.AddWithValue("@RoomImage", filepath);
                cmd.Parameters.AddWithValue("@RoomRates", priceTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@RoomDescription", descriptionTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@AdultCapacity", adultTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@ChildrenCapacity", childrenTextBox.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE Rooms SET RoomDescription=@RoomDescription, RoomPrice=@RoomPrice, AdultCapacity=@AdultCapacity, ChildrenCapacity=@ChildrenCapacity Where RoomTypeID='" + roomTypeList.SelectedItem.Value + "'", con);
                cmd.Parameters.AddWithValue("@RoomPrice", priceTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@RoomDescription", descriptionTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@AdultCapacity", adultTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@ChildrenCapacity", childrenTextBox.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                GridView1.DataBind();
                Response.Write("<script>alert('Room Details Updated Successfully');window.location='/Admin/Hotel Room Management.aspx';</script>");
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Delete Room
        void deleteRoom()
        {
            if (checkIfRoomExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE From Rooms WHERE RoomNumber='" + roomNoTextBox.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Room Deleted Successfully');window.location='/Admin/Hotel Room Management.aspx';</script>");

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
                Response.Write("<script>alert('Invalid Room Number ID');</script>");
            }
        }

        void clearForm()
        {
            roomNoTextBox.Text = "";
            statusTextBox.Text = "";
            roomTypeList.SelectedIndex = 0;
            priceTextBox.Text = "";
            adultTextBox.Text = "";
            childrenTextBox.Text = "";
            descriptionTextBox.Text = "";

        }

    }

}