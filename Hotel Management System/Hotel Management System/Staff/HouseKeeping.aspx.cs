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
    public partial class HouseKeeping : System.Web.UI.Page
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

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            TableCell statusCell = e.Row.Cells[2];
            if (statusCell.Text == "1")
            {
                statusCell.Text = "Pending";
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            updateStatus();
        }

        protected void idLinkButton_Click(object sender, EventArgs e)
        {
            getRoomNumber();
        }

        protected void roomLinkButton_Click(object sender, EventArgs e)
        {
            getKeepingID();
        }

        

        void getRoomNumber()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * From Housekeeping WHERE HousekeepingID='" + idTextBox.Text.Trim() + "' AND KeepingStatusID = '1'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        roomTextBox.Text = dr.GetValue(1).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('HouseKeeping ID Does Not Exist');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getKeepingID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * From Housekeeping WHERE RoomNumber='" + roomTextBox.Text.Trim() + "' AND KeepingStatusID = '1'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        idTextBox.Text = dr.GetValue(0).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Room Number Does Not Exist');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateStatus()
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
                    SqlCommand cmd = new SqlCommand("UPDATE Housekeeping set KeepingStatusID=@KeepingStatusID WHERE HousekeepingID='" + idTextBox.Text.Trim() + "' AND RoomNumber='" + roomTextBox.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@KeepingStatusID", 2);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Room Status Updated Successfully');</script>");
                    clearForm();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Housekeeping Request Does Not Exist');</script>");
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

                SqlCommand cmd = new SqlCommand("SELECT * FROM Housekeeping WHERE HousekeepingID='" + idTextBox.Text.Trim() + "' AND RoomNumber='" + roomTextBox.Text.Trim() + "';", con);
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
            idTextBox.Text = "";
            roomTextBox.Text = "";
        }
    }
}