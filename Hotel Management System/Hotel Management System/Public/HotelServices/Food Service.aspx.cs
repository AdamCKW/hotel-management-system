using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Management_System.Public
{
    public partial class Food_Service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void foodButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("FoodList.aspx");
        }

        protected void drinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/HotelServices/DrinkList.aspx");
        }
    }
}