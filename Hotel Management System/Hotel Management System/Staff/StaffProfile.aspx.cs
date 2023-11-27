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
    public partial class StaffProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string fname, lname, dob, contact, state, city, zip, address, loginid;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"]))
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');window.location='/Staff/StaffLogin.aspx';</script>");
                }
                else
                {

                    if (!Page.IsPostBack)
                    {
                        getUserDetails();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Session Expired. Please Login Again');window.location='/Staff/StaffLogin.aspx';</script>");
            }
        }

        protected void editButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                Response.Write("<script>alert('Session Expired. Please Login Again');window.location='/Staff/StaffLogin.aspx';</script>");
            }
            else
            {
                firstName.ReadOnly = false;
                fname = firstName.Text.Trim();

                lastName.ReadOnly = false;
                lname = lastName.Text.Trim();

                dateOfBirth.ReadOnly = false;
                dob = dateOfBirth.Text.Trim();

                contactNumber.ReadOnly = false;
                contact = contactNumber.Text.Trim();

                newEmailLabel.Visible = true;
                newEmail.Visible = true;

                stateTextBox.ReadOnly = false;
                state = stateTextBox.Text.Trim();

                cityTextBox.ReadOnly = false;
                city = cityTextBox.Text.Trim();

                zipTextBox.ReadOnly = false;
                zip = zipTextBox.Text.Trim();

                addressTextBox.ReadOnly = false;
                address = addressTextBox.Text.Trim();

                staffID.ReadOnly = false;
                loginid = staffID.Text.Trim();

                newPasswordLabel.Visible = true;
                newPassword.Visible = true;
                editButton.Visible = false;
                editButton.Enabled = false;
                updateButton.Visible = true;
                updateButton.Enabled = true;
                
                
            }
            
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                Response.Write("<script>alert('Session Expired. Please Login Again');window.location='/Staff/StaffLogin.aspx';</script>");
            }
            else
            {
                updateUserDetails();
            }
        }

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

        void getUserDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM staff_tbl WHERE LoginID='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                //staff_tbl: StaffID, LoginID, Password, FirstName, LastName, DoB, ContactNo, Email, State, City, ZipCode, FullAddress

                firstName.Text = dt.Rows[0]["FirstName"].ToString();
                lastName.Text = dt.Rows[0]["LastName"].ToString();
                dateOfBirth.Text = dt.Rows[0]["DoB"].ToString();
                contactNumber.Text = dt.Rows[0]["ContactNo"].ToString();
                emailText.Text = dt.Rows[0]["Email"].ToString();
                stateTextBox.Text = dt.Rows[0]["State"].ToString();
                cityTextBox.Text = dt.Rows[0]["City"].ToString();
                zipTextBox.Text = dt.Rows[0]["ZipCode"].ToString();
                addressTextBox.Text = dt.Rows[0]["FullAddress"].ToString();
                staffID.Text = dt.Rows[0]["LoginID"].ToString();
                staffPassword.Text = dt.Rows[0]["Password"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void checkTextBox()
        {
            if (firstName.Text.Trim() == "")
            {
                firstName.Text = fname;
            }
            if (lastName.Text.Trim() == "")
            {
                lastName.Text = lname;
            }
            if (dateOfBirth.Text.Trim() == "")
            {
                dateOfBirth.Text = dob;
            }
            if (contactNumber.Text.Trim() == "")
            {
                contactNumber.Text = contact;
            }
            if (stateTextBox.Text.Trim() == "")
            {
                stateTextBox.Text = state;
            }
            if (cityTextBox.Text.Trim() == "")
            {
                cityTextBox.Text = city;
            }
            if (zipTextBox.Text.Trim() == "")
            {
                zipTextBox.Text = zip;
            }
            if (addressTextBox.Text.Trim() == "")
            {
                addressTextBox.Text = address;
            }
            if(staffID.Text.Trim() == "")
            {
                staffID.Text = loginid;
            }
        }

        void updateUserDetails()
        {
            string password = "";
            string email = "";
            if (newPassword.Text.Trim() == "")
            {
                password = staffPassword.Text.Trim();
            }
            else
            {
                password = newPassword.Text.Trim();
            }
            if (newEmail.Text.Trim() == "")
            {
                email = emailText.Text.Trim();
            }
            else
            {
                email = newEmail.Text.Trim();
            }

            checkTextBox();

            if (staffID.Text.Trim() != loginid)
            {
                if (checkUserExists())
                {
                    Response.Write("<script>alert('User Already Exist with this Login ID, try other ID');</script>");
                }
                else
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }


                        SqlCommand cmd = new SqlCommand("UPDATE staff_tbl SET LoginID=@LoginID, Password=@Password, FirstName=@FirstName, LastName=@LastName, DoB=@DoB, ContactNo=@ContactNo, Email=@Email, State=@State, City=@City, ZipCode=@ZipCode, FullAddress=@FullAddress WHERE LoginID='" + Session["username"].ToString().Trim() + "'", con);

                        //staff_tbl: StaffID, LoginID, Password, FirstName, LastName, DoB, ContactNo, Email, State, City, ZipCode, FullAddress

                        cmd.Parameters.AddWithValue("@LoginID", staffID.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@FirstName", firstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@LastName", lastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@DoB", dateOfBirth.Text.Trim());
                        cmd.Parameters.AddWithValue("@ContactNo", contactNumber.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@State", stateTextBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@City", cityTextBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@ZipCode", zipTextBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@FullAddress", addressTextBox.Text.Trim());
                        if (staffID.Text.Trim() == "")
                        {
                            Session["username"] = loginid;
                        }
                        else
                        {
                            Session["username"] = staffID.Text.Trim();
                        }

                        int result = cmd.ExecuteNonQuery();
                        con.Close();
                        if (result > 0)
                        {

                            Response.Write("<script>alert('Your Details Are Updated Successfully');window.location='/Staff/StaffProfile.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invaid Inputs');</script>");
                        }

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }


                    SqlCommand cmd = new SqlCommand("UPDATE staff_tbl SET LoginID=@LoginID, Password=@Password, FirstName=@FirstName, LastName=@LastName, DoB=@DoB, ContactNo=@ContactNo, Email=@Email, State=@State, City=@City, ZipCode=@ZipCode, FullAddress=@FullAddress WHERE LoginID='" + Session["username"].ToString().Trim() + "'", con);

                    //staff_tbl: StaffID, LoginID, Password, FirstName, LastName, DoB, ContactNo, Email, State, City, ZipCode, FullAddress

                    cmd.Parameters.AddWithValue("@LoginID", staffID.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@FirstName", firstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", lastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@DoB", dateOfBirth.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactNo", contactNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@State", stateTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", cityTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@ZipCode", zipTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@FullAddress", addressTextBox.Text.Trim());
                    Session["username"] = staffID.Text.Trim();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    if (result > 0)
                    {

                        Response.Write("<script>alert('Your Details Are Updated Successfully');window.location='/Staff/StaffProfile.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invaid Inputs');</script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            
        }
    }
}