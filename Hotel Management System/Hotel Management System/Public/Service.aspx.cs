using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Management_System.Public
{
    public partial class Service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cleaningImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Public/HotelServices/RoomCleaning.aspx");
        }

        protected void cleaningButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/HotelServices/RoomCleaning.aspx");
        }

        protected void foodImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Public/HotelServices/Food Service.aspx");
        }

        protected void foodButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/HotelServices/Food Service.aspx");
        }
    }
}