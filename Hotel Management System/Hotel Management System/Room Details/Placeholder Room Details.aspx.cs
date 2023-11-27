using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Speech.Synthesis;

namespace Hotel_Management_System.Room_Details
{
    public partial class Placeholder_Room_Details : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static SpeechSynthesizer sp = new SpeechSynthesizer();

        protected void Page_Load(object sender, EventArgs e)
        {
            var current = sp.GetCurrentlySpokenPrompt();

            if (current != null)
            {
                sp.SpeakAsyncCancel(current);
                sp.SpeakAsyncCancelAll();
            }

            cookieLabel.Text = "6";
            getData();

        }

        public void SpeakAsyncCancel(System.Speech.Synthesis.Prompt prompt)
        {

        }
        void getData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from RoomType where RoomTypeID='" + cookieLabel.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    //Response.Write("<script>alert('" + dt.Rows[0]["RoomType"].ToString() + "');</script>");
                    //0              1             2            3          4           5                6             7
                    //RoomTypeID, RoomType, RoomDescription, RoomRates, Deposit, AdultCapacity, ChildrenCapacity, RoomImage
                    string roomprice, roomdeposit;
                    roomNameLabel.Text = dt.Rows[0]["RoomType"].ToString().Trim();
                    featureLabel.Text = dt.Rows[0]["RoomDescription"].ToString().Trim();
                    roomprice = dt.Rows[0]["RoomRates"].ToString().Trim();
                    roomdeposit = dt.Rows[0]["Deposit"].ToString().Trim();
                    roomImage.ImageUrl = dt.Rows[0]["RoomImage"].ToString();
                    roomPriceLabel.Text = "RM " + roomprice + " Nett (Rates With 6 % SST)";
                    roomDepositLabel.Text = "RM " + roomdeposit + " Nett (Refundable Deposit)";

                }
                else
                {
                    Response.Write("<script>alert('Room Does Not Exist');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void audioImageButton_Click(object sender, ImageClickEventArgs e)
        {
            SpeechSynthesizer sp = new SpeechSynthesizer();
            var current = sp.GetCurrentlySpokenPrompt();

            if (current != null)
            {
                sp.SpeakAsyncCancel(current);
                sp.SpeakAsyncCancelAll();
            }
            sp.Volume = 100;
            sp.SpeakAsync(featureLabel.Text);
        }
    }
}