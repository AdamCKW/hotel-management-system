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
    public partial class StaffSignUp : System.Web.UI.Page
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
        }

        protected void signUpButton_Click(object sender, EventArgs e)
        {
            if (checkUserExists())
            {

            Response.Write("<script>alert('User Already Exist with this Login ID, try other ID');</script>");

            }
            else if (checkUserText())
            {
                Response.Write("<script>alert('Please Ensure All Input Field Are Filled Correctly');</script>");
            }
            else
            {
                addUser();
            }

        }


        //User Defined Method

        //LoginID, Password, FirstName, LastName, DoB, ContactNo, Email, State, City, ZipCode, FullAddress

        //Check User Exist
        bool checkUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from staff_tbl where LoginID='" + staffID.Text.Trim() + "';", con);
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

        //Check TextBox Filled
        bool checkUserText()
        {
            try
            {
                if (firstName.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's First Name');</script>");
                    return true;
                }
                else if (lastName.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's Last Name');</script>");
                    return true;
                }
                else if (dateOfBirth.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Select User's Date of Birth');</script>");
                    return true;
                }
                else if (contactNumber.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's Contact Number');</script>");
                    return true;
                }
                else if (emailText.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's Email');</script>");
                    return true;
                }
                else if (emailText.Text.Trim() != confirmEmail.Text.Trim())
                {
                    Response.Write("<script>alert('Please Ensure Both Email Are The Same');</script>");
                    return true;
                }
                else if (DropDownList1.SelectedItem.Value == "Select")
                {
                    Response.Write("<script>alert('Please Select User's State');</script>");
                    return true;
                }
                else if (cityTextBox.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's City');</script>");
                    return true;
                }
                else if (zipTextBox.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's Zip Code');</script>");
                    return true;
                }
                else if (staffID.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's Login ID');</script>");
                    return true;
                }
                else if (staffPassword.Text.Trim() == "")
                {
                    Response.Write("<script>alert('Please Enter User's Password');</script>");
                    return true;
                }
                else if (staffPassword.Text.Trim() != confirmPassword.Text.Trim())
                {
                    Response.Write("<script>alert('Please Ensure Both Password Are The Same');</script>");
                    return true;
                }
                else if (staffPassword.Text.Length < 8)
                {
                    Response.Write("<script>alert('Password Requires Minimum Of 8 Characters');</script>");
                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //Add User
        void addUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into staff_tbl(LoginID,Password,FirstName,LastName,DoB,ContactNo,Email,State,City,ZipCode,FullAddress) values (@LoginID,@Password,@FirstName,@LastName,@DoB,@ContactNo,@Email,@State,@City,@ZipCode,@FullAddress)", con);

                cmd.Parameters.AddWithValue("@LoginID", staffID.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", staffPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@FirstName", firstName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", lastName.Text.Trim());
                cmd.Parameters.AddWithValue("@DoB", dateOfBirth.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNo", contactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", emailText.Text.Trim());
                cmd.Parameters.AddWithValue("@State", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@City", cityTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@ZipCode", zipTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@FullAddress", addressTextBox.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('User Have Been Added Successfully');window.location='/Staff/StaffSignUp.aspx';</script>");
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //clear form
        void clearForm()
        {
            firstName.Text = "";
            lastName.Text = "";
            dateOfBirth.Text = "";
            contactNumber.Text = "";
            emailText.Text = "";
            confirmEmail.Text = "";
            cityTextBox.Text = "";
            zipTextBox.Text = "";
            addressTextBox.Text = "";
            staffID.Text = "";
            staffPassword.Text = "";
            confirmPassword.Text = "";
            DropDownList1.ClearSelection();
        }
    }
}