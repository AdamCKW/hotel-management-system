using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace Hotel_Management_System.Public
{
    public partial class Receipt : System.Web.UI.Page
    {
        static string quantity, room;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                quantity = "0";
                room = "test";

                if (Application["moveID"] != null)
                {
                    string moveID = Application["moveID"].ToString();
                    bookingIDLabel.Text = moveID;

                }
                if (Application["roomTypeLabel"] != null)
                {
                    string roomTypeLabel = Application["roomTypeLabel"].ToString();
                    typeLabel.Text = roomTypeLabel;
                }
                if (Application["totalPrice"] != null)
                {
                    string totalPrice = Application["totalPrice"].ToString();
                    totalLabel.Text = totalPrice;
                }
                if (Application["checkIn"] != null)
                {
                    string checkIn = Application["checkIn"].ToString();
                    inLabel.Text = checkIn;
                }
                if (Application["checkOut"] != null)
                {
                    string checkOut = Application["checkOut"].ToString();
                    outLabel.Text = checkOut;
                }
                if (Application["nights"] != null)
                {
                    string nights = Application["nights"].ToString();
                    nightLabel.Text = nights;
                }
                if (Application["Quantity"] != null)
                {
                    quantity = Application["Quantity"].ToString();
                }
                if (Application["roomtypetext"] != null)
                {
                    room = Application["roomtypetext"].ToString();
                }
            }
        }

        protected void GenerateInvoicePDF(object sender, EventArgs e)
        {
            //Data for Invoice (Bill).
            string companyName = "CCafe Hotel";
            string orderNo = bookingIDLabel.Text;
            string dates = inLabel.Text.Trim() + " - " + outLabel.Text.Trim();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[4] {
                            new DataColumn("Room Type", typeof(string)),
                            new DataColumn("Quantity", typeof(string)),
                            new DataColumn("Nights", typeof(string)),
                            new DataColumn("Total", typeof(string))});
            dt.Rows.Add(room, quantity, nightLabel.Text, totalLabel.Text);

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    StringBuilder sb = new StringBuilder();

                    //Generate Invoice (Bill) Header.
                    sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                    sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Room Reservation Invoice</b></td></tr>");
                    sb.Append("<tr><td colspan = '2'></td></tr>");
                    sb.Append("<tr><td><b>Booking ID: </b>");
                    sb.Append(orderNo);
                    sb.Append("</td><td align = 'right'><b>Date: </b>");
                    sb.Append(DateTime.Now);
                    sb.Append("</td></tr>");
                    sb.Append("<tr><td colspan = '2'><b>Company Name: </b>");
                    sb.Append(companyName);
                    sb.Append("</td></tr>");
                    sb.Append("<tr><td colspan = '2'><b>Reservation Dates: </b>");
                    sb.Append(dates);
                    sb.Append("</td></tr>");
                    sb.Append("</table>");
                    sb.Append("<br />");

                    //Generate Invoice (Bill) Items Grid.
                    sb.Append("<table border = '1'>");
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<th>");
                        sb.Append(column.ColumnName);
                        sb.Append("</th>");
                    }
                    sb.Append("</tr>");
                    foreach (DataRow row in dt.Rows)
                    {
                        sb.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            sb.Append("<td>");
                            sb.Append(row[column]);
                            sb.Append("</td>");
                        }
                        sb.Append("</tr>");
                    }
                    sb.Append("</tr></table>");

                    //Export HTML String as PDF.
                    StringReader sr = new StringReader(sb.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + companyName + "_" + DateTime.Now + ".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

    }
}