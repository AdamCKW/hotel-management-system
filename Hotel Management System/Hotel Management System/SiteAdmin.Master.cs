using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Management_System
{
    public partial class SiteAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"])) //Guest / Not Logged In
                {

                    Response.Redirect("/Public/HomePage.aspx");

                }
                else if (Session["role"].Equals("admin")) //Admin
                {
                    roomSales.Visible = true;
                    orderSales.Visible = true;
                    customerDetails.Visible = true;
                    addStaff.Visible = true;
                    accountManagement.Visible = true;
                    productManagement.Visible = true;
                    roomManagement.Visible = true;
                    addStaff.Visible = true;

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["firstname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            Response.Redirect("/Public/HomePage.aspx");
        }

        protected void logoutLinkButton_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["firstname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            Response.Redirect("/Public/HomePage.aspx");
        }
    }
}