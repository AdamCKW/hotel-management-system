using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Management_System.Public
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void standardQueenImage_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Room Details/Standard Queen Room.aspx");
        }

        protected void standardQueenButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Room Details/Standard Queen Room.aspx");
        }

        protected void standardTwinImage_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Room Details/Standard Twin Room.aspx");
        }

        protected void standardTwinButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Room Details/Standard Twin Room.aspx");
        }

        protected void deluxeQueenImage_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Room Details/Deluxe Queen Room.aspx");
        }

        protected void deluxeQueenButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Room Details/Deluxe Queen Room.aspx");
        }

        protected void deluxeTwinImage_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Room Details/Deluxe Twin Room.aspx");
        }

        protected void deluxeTwinButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Room Details/Deluxe Twin Room.aspx");
        }

        protected void suiteImage_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Room Details/Suite Room.aspx");
        }

        protected void suiteButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Room Details/Suite Room.aspx");
        }

        protected void familyImage_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Room Details/Family Room.aspx");
        }

        protected void familyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Room Details/Family Room.aspx");
        }

        protected void budgetImage_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Room Details/Budget Room.aspx");
        }

        protected void budgetButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Room Details/Budget Room.aspx");
        }

    }
}