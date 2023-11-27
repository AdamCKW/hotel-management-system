using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Management_System.Admin
{
    public partial class Staff_Management : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

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

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            deleteUserByID();
        }

        protected void getButton_Click(object sender, EventArgs e)
        {
            getStaffData();
        }

        //User Defined Methods

        //Get Data
        void getStaffData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from staff_tbl where StaffID='" + idTextBox.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        firstName.Text = dr.GetValue(3).ToString();
                        lastName.Text = dr.GetValue(4).ToString();
                        dobTextBox.Text = dr.GetValue(5).ToString();
                        contactTextBox.Text = dr.GetValue(6).ToString();
                        emailTextBox.Text = dr.GetValue(7).ToString();
                        stateTextBox.Text = dr.GetValue(8).ToString();
                        cityTextBox.Text = dr.GetValue(9).ToString();
                        zipTextBox.Text = dr.GetValue(10).ToString();
                        addressTextBox.Text = dr.GetValue(11).ToString();
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Staff ID Does Not Exist');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Check if User Exist
        bool checkIfUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from staff_tbl where StaffID='" + idTextBox.Text.Trim() + "';", con);
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

        //Delete User
        void deleteUserByID()
        {
            if (checkIfUserExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from staff_tbl WHERE StaffID='" + idTextBox.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('User Deleted Successfully');window.location='/Admin/Staff Management.aspx';</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Staff ID');</script>");
            }
        }

        //Clear form
        void clearForm()
        {
            idTextBox.Text = "";
            firstName.Text = "";
            lastName.Text = "";
            dobTextBox.Text = "";
            contactTextBox.Text = "";
            emailTextBox.Text = "";
            stateTextBox.Text = "";
            cityTextBox.Text = "";
            zipTextBox.Text = "";
            addressTextBox.Text = "";
        }

    }
}