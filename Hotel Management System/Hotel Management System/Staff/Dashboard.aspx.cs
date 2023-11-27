using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Management_System.Staff
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"]))
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');window.location='/Staff/StaffLogin.aspx';</script>");
                }
                else if (Session["role"].Equals("admin"))
                {
                    admin.Visible = true;
                }
                else
                {
                    admin.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void checkImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Staff/Check InOut.aspx");
        }

        protected void checkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/Check InOut.aspx");
        }

        protected void reservationImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Staff/ManageReservation.aspx");
        }

        protected void reservationButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/ManageReservation.aspx");
        }

        protected void orderImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Staff/Order Page.aspx");
        }

        protected void orderButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/Order Page.aspx");
        }

        protected void houseImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Staff/HouseKeeping.aspx");
        }

        protected void houseButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/HouseKeeping.aspx");
        }

        protected void availabilityImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Staff/Search Room.aspx");
        }

        protected void availabilityButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff/Search Room.aspx");
        }

        protected void adminImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Admin/Sales.aspx");
        }

        protected void adminLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Sales.aspx");
        }
    }
}