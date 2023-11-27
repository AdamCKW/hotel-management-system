using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Hotel_Management_System
{

    public partial class Site1 : System.Web.UI.MasterPage
    {
  

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"])) //Guest / Not Logged In
                {

                    dashboardButton.Visible = false; 
                    logoutButton.Visible = false;
                    AdminLogin.Visible = true;              //true
                    staffProfileButton.Visible = false;
                    StaffLogin.Visible = true;              //true


                }
                else if (Session["role"].Equals("user")) //Staff
                {

                    dashboardButton.Visible = true;        //true
                    logoutButton.Visible = true;            //true
                    AdminLogin.Visible = true;              //true
                    staffProfileButton.Visible = true;      //true
                    StaffLogin.Visible = false;

                    staffProfileButton.Text = "Hello " + Session["username"].ToString();

                }
                else if (Session["role"].Equals("admin")) //Admin
                {

                    dashboardButton.Visible = true;         //true
                    logoutButton.Visible = true;            //true
                    AdminLogin.Visible = false;
                    staffProfileButton.Visible = true;      //true
                    StaffLogin.Visible = true;              //true

                    staffProfileButton.Text = "Hello Admin";

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void dashboardButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/Dashboard.aspx");
        }

        protected void roomDetailsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/Rooms.aspx");
        }

        protected void serviceButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/Service.aspx");
        }

        protected void bookButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/Search Room.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["firstname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            Response.Redirect("/Public/HomePage.aspx");
            //dashboardButton.Visible = false;
            //loginButton.Visible = false;
            //signUpButton.Visible = false;
            //logoutButton.Visible = false;
            //AdminLogin.Visible = true;              //true
            //staffProfileButton.Visible = false;
            //StaffLogin.Visible = true;              //true
            //StaffSignUp.Visible = false;
            //productButton.Visible = false;
            //roomButton.Visible = false;
            //CustomerManagement.Visible = false;
            //StaffManagement.Visible = false;
        }


        protected void staffProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/StaffProfile.aspx");
        }

        protected void AdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AdminLogin.aspx");
        }

        protected void StaffLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/StaffLogin.aspx");
        }

        protected void findReservation_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/Find Reservation.aspx");
        }

        protected void policiesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/Hotel Policies.aspx");
        }
    }
}