using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Speech.Synthesis;

namespace Hotel_Management_System.Public
{
    public partial class HomePage : System.Web.UI.Page
    {
        static SpeechSynthesizer sp = new SpeechSynthesizer();

        protected void Page_Load(object sender, EventArgs e)
        {
            var current = sp.GetCurrentlySpokenPrompt();
            if (current != null)
            {
                sp.SpeakAsyncCancel(current);
                sp.SpeakAsyncCancelAll();
            }
        }

        protected void bookLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Public/Search Room.aspx");
        }

        public void SpeakAsyncCancel(System.Speech.Synthesis.Prompt prompt) 
        {
        
        }

        protected void audioImageButton_Click(object sender, ImageClickEventArgs e)
        {
            var current = sp.GetCurrentlySpokenPrompt();

            if (current != null)
            {
                sp.SpeakAsyncCancel(current);
                sp.SpeakAsyncCancelAll();
            }
            sp.Volume = 100;
            sp.SpeakAsync(card1.InnerText);
        }

        protected void audioImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            var current = sp.GetCurrentlySpokenPrompt();

            if (current != null)
            {
                sp.SpeakAsyncCancel(current);
                sp.SpeakAsyncCancelAll();
            }
            sp.Volume = 100;
            sp.SpeakAsync(card2.InnerText);

        }

        protected void audioImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            var current = sp.GetCurrentlySpokenPrompt();

            if (current != null)
            {
                sp.SpeakAsyncCancel(current);
                sp.SpeakAsyncCancelAll();
            }
            sp.Volume = 100;
            sp.SpeakAsync(card3.InnerText);
        }
    }
}