using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Management_System.Public.TestingOnly
{
    public partial class Booking_Form : System.Web.UI.Page
    {
        static int count, available, notavailable, quantityroom, adultcount, childcount, night, nolength, cvclength, yearlength, bookingID, customerID;
        static string prefix, fname, lname, email, pnumber, city, zip, state, country, acap, ccap, roomname, roomrate, cardname, cardno, cvc, exmonth, exyear, checkin, checkout, moveID;
        static decimal totalprice, price, oneroomprice;

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                if (Application["dateIn"] != null)
                {
                    string dateIn = Application["dateIn"].ToString();
                    checkinTextBox.Text = dateIn;
                }
                if (Application["dateOut"] != null)
                {
                    string dateOut = Application["dateOut"].ToString();
                    checkoutTextBox.Text = dateOut;
                }
                if (Application["adult"] != null)
                {
                    string adultcap = Application["adult"].ToString();
                    adultCapacity.Value = adultcap;
                }
                if (Application["children"] != null)
                {
                    string childrencap = Application["children"].ToString();
                    childrenCapacity.Value = childrencap;
                }
                if (Application["Chosen Room"] != null)
                {
                    string selectedroom = Application["Chosen Room"].ToString();
                    int selectedroomtype = int.Parse(selectedroom);
                    roomDropDownList.SelectedIndex = selectedroomtype;
                }

                count = 0;
                available = 0;
                notavailable = 0;
            }
        }

        protected void calculateButton_Click(object sender, EventArgs e)
        {
            getInputData();
            getRoomData();
            
            if (checkinput())
            {
                Response.Write("<script>alert('Please Make Sure All Fields Are Filled Correctly');</script>");
                clearLabel();
                reserveButton.Visible = false;
            }
            else
            {
                if (checkdate())
                {
                    if (checkRoomCount())
                    {
                        if(checkAvailablitity())
                        {
                            available = count - notavailable;
                            if (available>0)
                            {
                                if (checkvalues())
                                {
                                    Response.Write("<script>alert('Invalid Values ( Please check Adult / Children / Quantity )');</script>");
                                    clearLabel();
                                    reserveButton.Visible = false;
                                }
                                else
                                {
                                    if (quantityavailable())
                                    {
                                        Response.Write("<script>alert('Invalid Values ( Exceeded Available Rooms )');</script>");
                                        clearLabel();
                                        reserveButton.Visible = false;
                                    }
                                    else
                                    {
                                        calculate();
                                        reserveButton.Visible = true;
                                        reserveButton.Enabled = true;
                                    }
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('No Rooms Availablee');</script>");
                                clearLabel();
                                reserveButton.Visible = false;
                            }
                        }
                        else
                        {
                            available = count;
                            if (available > 0)
                            {
                                if (checkvalues())
                                {
                                    Response.Write("<script>alert('Invalid Values ( Please check Adult / Children / Quantity )');</script>");
                                    clearLabel();
                                    reserveButton.Visible = false;
                                }
                                else
                                {
                                    if (quantityavailable())
                                    {
                                        Response.Write("<script>alert('Invalid Values ( Exceeded Available Rooms )');</script>");
                                        clearLabel();
                                        reserveButton.Visible = false;
                                    }
                                    else
                                    {                                     
                                        calculate();
                                        reserveButton.Visible = true;
                                        reserveButton.Enabled = true;
                                    }
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('No Rooms Available');</script>");
                                clearLabel();
                                reserveButton.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('No Rooms Available');</script>");
                        clearLabel();
                        reserveButton.Visible = false;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Dates');</script>");
                    clearLabel();
                }
            }
            
        }

        protected void reserveButton_Click(object sender, EventArgs e)
        {
            moveID = "";
            for (int i = 0; i < quantityroom; i++)
            {
                makebooking();
                moveID = moveID + " + ID" + bookingID.ToString();
            }
            addcustomer();
            sendCookies();
            Response.Write("<script>alert('Room Reservation Made Successfully.');window.location='/Public/Receipt.aspx';</script>");
        }

        //user defined method
        bool quantityavailable()
        {
            try
            {
                int totalcount = adultcount + childcount;
                int cap1 = int.Parse(acap);
                int cap2 = int.Parse(ccap);
                int totalcap = quantityroom * (cap1 + cap2);

                if (quantityroom>available || totalcap<totalcount)
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

        bool checkRoomCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Rooms where RoomTypeID='" + roomDropDownList.SelectedValue + "' And IsActive = 'True' ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    count = dt.Rows.Count;
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

        bool checkAvailablitity()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from booking_tbl WHERE RoomTypeID='" + roomDropDownList.SelectedValue + "' AND (BookingStatusID='2' OR BookingStatusID='3') AND ((Check_InDate <= '" + checkinTextBox.Text.Trim() + "' AND Check_OutDate >= '" + checkinTextBox.Text.Trim() + "') OR (Check_InDate < '" + checkoutTextBox.Text.Trim() + "' AND Check_OutDate >= '" + checkoutTextBox.Text.Trim() + "') OR ('" + checkinTextBox.Text.Trim() + "' <= Check_InDate  AND '" + checkoutTextBox.Text.Trim() + "' >= Check_OutDate)) ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    notavailable = dt.Rows.Count;
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

        bool checkdate()
        {
            try
            {
                DateTime today = DateTime.Today;
                DateTime indate = Convert.ToDateTime(checkinTextBox.Text);
                DateTime outdate = Convert.ToDateTime(checkoutTextBox.Text);
                if (indate != outdate && indate >= today && outdate > today && indate < outdate)
                {
                    TimeSpan period = outdate - indate;
                    int days = period.Days;
                    night = days;
                    checkin = indate.ToString("d");
                    checkout = outdate.ToString("d");

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

        bool checkvalues()
        {
            try
            {
                string tempquantity = quantityText1.Value.ToString().Trim();
                string tempadult = adultCapacity.Value.ToString().Trim();
                string tempchild = childrenCapacity.Value.ToString().Trim();

                //quantity
                if (tempquantity == "")
                {
                    tempquantity = "0";
                    quantityroom = int.Parse(tempquantity);
                }
                else
                {
                    quantityroom = int.Parse(quantityText1.Value.Trim());
                }

                //adult
                if (tempadult == "")
                {
                    tempadult = "0";
                    adultcount = int.Parse(tempadult);
                }
                else
                {
                    adultcount = int.Parse(adultCapacity.Value.Trim());
                }

                //child
                if (tempchild == "")
                {
                    tempchild = "0";
                    childcount = int.Parse(tempchild);
                }
                else
                {
                    childcount = int.Parse(childrenCapacity.Value.Trim());
                }



                if (quantityroom == 0 || adultcount == 0 && childcount == 0)
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

        bool checkinput()
        {
            try
            {
                int tempmonth = int.Parse(exmonth);
                int tempyear = int.Parse(exyear);
                if(fname == "" || lname == "" || email == "" || pnumber == "" || city == "" || zip == "" || state == "" || country == "" || cardname == "" || cardno == "" || cvc == "" || exmonth == "" || exyear == "" || nolength != 16 || cvclength != 3 || yearlength != 2 || tempmonth>=13 || tempyear<=20 )
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

        void getInputData()
        {
            try
            {
                fname = firstName.Text.Trim();
                lname = lastName.Text.Trim();
                email = emailTextBox.Text.Trim();
                pnumber = phoneNumber.Value.ToString();
                city = cityTextBox.Text.Trim();
                zip = zipcodeTextBox.Text.Trim();
                state = stateTextBox.Text.Trim();
                country = countryTextBox.Text.Trim();
                prefix = prefixList.SelectedItem.Value;
                cardname = cardNameTextBox.Text.Trim();
                cardno = cardNumber.Value.ToString();
                cvc = cvcText.Value.ToString();
                exmonth = monthText.Value.ToString();
                exyear = yearText.Value.ToString();

                nolength = cardno.Length;
                cvclength = cvc.Length;
                yearlength = exyear.Length;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getRoomData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from RoomType where RoomTypeID='" + roomDropDownList.SelectedItem.Value + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    //Response.Write("<script>alert('" + dt.Rows[0]["RoomType"].ToString() + "');</script>");
                    //0              1             2            3          4           5                6             7
                    //RoomTypeID, RoomType, RoomDescription, RoomRates, Deposit, AdultCapacity, ChildrenCapacity, RoomImage
                    roomrate = dt.Rows[0]["RoomRates"].ToString().Trim();
                    roomname = dt.Rows[0]["RoomType"].ToString().Trim();
                    acap = dt.Rows[0]["AdultCapacity"].ToString().Trim();
                    ccap = dt.Rows[0]["ChildrenCapacity"].ToString().Trim();

                    price = decimal.Parse(roomrate);

                }
                else
                {
                    Response.Write("<script>alert('Please Select Room Type');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void calculate()
        {
            try
            {
                datesLabel.Text = checkin + " - " + checkout;
                roomLabel.Text = roomname + " * " + quantityroom;
                peopleLabel.Text = adultcount + " Adults - " + childcount + " Children";
                priceLabel1.Text = "RM " + roomrate + " per Night";
                totalprice = (price * night) * quantityroom;
                oneroomprice = (price * night);
                totalMoneyLabel.Text = "RM " + totalprice;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearLabel()
        {
            datesLabel.Text = "";
            roomLabel.Text = "";
            peopleLabel.Text = "";
            priceLabel1.Text = "";
            totalMoneyLabel.Text = "";
            reserveButton.Visible = false;
            reserveButton.Enabled = false;
        }

        void sendCookies()
        {
            Application["moveID"] = moveID;
            Application["roomTypeLabel"] =  roomLabel.Text;
            Application["totalPrice"] = totalMoneyLabel.Text;
            Application["checkIn"] = checkinTextBox.Text;
            Application["checkOut"] = checkoutTextBox.Text;
            Application["nights"] = night;
        }

        //make reservation
        void makebooking()
        {
            try
            {
                string today = DateTime.Now.ToString("yyyy-MM-dd");
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT MAX(CustomerID) FROM CustomerDetails", con);
                int? countCustomerID = cmd.ExecuteScalar() as int?;
                if (countCustomerID == null)
                {
                    customerID = 1;
                }
                else
                {
                    customerID = countCustomerID.Value + 1;
                }

                cmd = new SqlCommand("SELECT MAX(BookingID) FROM booking_tbl", con);
                int? countID = cmd.ExecuteScalar() as int?;
                if (countID == null)
                {
                    bookingID = 1;
                }
                else
                {
                    bookingID = countID.Value + 1;
                }
                //int customerID = Convert.ToInt32(cmd.ExecuteScalar());
                //customerID += 1;

                cmd = new SqlCommand("INSERT INTO booking_tbl(BookingID, RoomTypeID, BookingStatusID, CustomerID, BookingDate, Night, Check_InDate, Check_OutDate, NumberOfAdult, NumberOfChildren, TotalAmount) values (@BookingID, @RoomTypeID, @BookingStatusID, @CustomerID, @BookingDate, @Night, @Check_InDate, @Check_OutDate, @NumberOfAdult, @NumberOfChildren, @TotalAmount)", con);
                //booking_tbl: BookingID, RoomTypeID, BookingStatusID, RoomNumber, CustomerID, BookingDate, Night, Check_InDate, Check_OutDate, NumberOfAdult, NumberOfChildren, TotalAmount
                cmd.Parameters.AddWithValue("@BookingID", bookingID);
                cmd.Parameters.AddWithValue("@RoomTypeID", roomDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@BookingStatusID", "2");
                cmd.Parameters.AddWithValue("@CustomerID", customerID);
                cmd.Parameters.AddWithValue("@BookingDate", today);
                cmd.Parameters.AddWithValue("@Night", night);
                cmd.Parameters.AddWithValue("@Check_InDate", checkinTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Check_OutDate", checkoutTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@NumberOfAdult", adultcount);
                cmd.Parameters.AddWithValue("@NumberOfChildren", childcount);
                cmd.Parameters.AddWithValue("@TotalAmount", oneroomprice);
                cmd.ExecuteNonQuery();
                
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void addcustomer()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //int bookingID = Convert.ToInt32(cmd.ExecuteScalar());
                SqlCommand cmd = new SqlCommand("INSERT INTO CustomerDetails(CustomerID, Prefix, FirstName, LastName, Email, CustomerNo, Zipcode, City, State, Country, CCHolderName, CCNumber, CCExpDate, CVC) values (@CustomerID, @Prefix, @FirstName, @LastName, @Email, @CustomerNo, @Zipcode, @City, @State, @Country, @CCHolderName, @CCNumber, @CCExpDate, @CVC)", con);
                //CustomerDetails : CustomerID, Prefix, FirstName, LastName, Email, CustomerNo, Zipcode, City, State, Country, CCHolderName, CCNumber, CCExpDate, CVC, BookingID
                string expiredate = exmonth + "/" + exyear;

                cmd.Parameters.AddWithValue("@CustomerID", customerID);
                cmd.Parameters.AddWithValue("@Prefix", prefixList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@FirstName", fname);
                cmd.Parameters.AddWithValue("@LastName", lname);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@CustomerNo", pnumber);
                cmd.Parameters.AddWithValue("@Zipcode", zip);
                cmd.Parameters.AddWithValue("@City", city);
                cmd.Parameters.AddWithValue("@State", state);
                cmd.Parameters.AddWithValue("@Country", country);
                cmd.Parameters.AddWithValue("@CCHolderName", cardname);
                cmd.Parameters.AddWithValue("@CCNumber", cardno);
                cmd.Parameters.AddWithValue("@CCExpDate", expiredate);
                cmd.Parameters.AddWithValue("@CVC", cvc);

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
}
    }
}